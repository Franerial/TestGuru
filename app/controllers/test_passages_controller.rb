class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]
  before_action :set_result_percentage, only: :result

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_result_percentage
    @result_percentage = (@test_passage.correct_questions.to_f / @test_passage.test.questions.count) * 100
  end
end
