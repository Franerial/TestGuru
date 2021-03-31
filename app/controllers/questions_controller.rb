class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy update edit]
  before_action :find_test, only: %i[create index new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<%@test.questions.each_with_index do |question, number|%> <%= number + 1 %>. <%= question.body%> <br> <%end%>"
  end

  def show
    @test = @question.test
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to test_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render inline: "Question with id=<%=params[:id]%> was not found!"
  end
end
