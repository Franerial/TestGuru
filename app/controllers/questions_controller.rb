class QuestionsController < ApplicationController
  before_action :initialize_question, only: %i[show destroy]
  before_action :initialize_test, only: %i[create index]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<%@test.questions.each_with_index do |question, number|%> <%= number + 1 %>. <%= question.body%> <br> <%end%>"
  end

  def show
    render inline: "<%= @question.body%>"
  end

  def new
  end

  def create
    @test.questions.create(question_params)
    render plain: "Question was successfully created!"
  end

  def destroy
    @question.destroy
    render plain: "Question was successfully deleted!"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def initialize_question
    @question = Question.find(params[:id])
  end

  def initialize_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render inline: "Question with id=<%=params[:id]%> was not found!"
  end
end
