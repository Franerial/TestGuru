class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.closed
  end

  def result; end

  def update
    @test_passage.check_lefted_time(params[:time_end])
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.closed
      TestsMailer.completed_test(@test_passage).deliver_now
      received_badges = BadgeDepartmentService.new(current_user, @test_passage).call
      flash[:notice] = t(".success") if received_badges.present?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
