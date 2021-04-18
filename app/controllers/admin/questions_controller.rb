class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: %i[show destroy update edit]
  before_action :find_test, only: %i[create new]

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
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
end
