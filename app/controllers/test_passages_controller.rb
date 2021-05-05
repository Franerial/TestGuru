class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if service.client.last_response
      flash[:notice] = "#{t(".success")} #{view_context.link_to(t(".find_here"), service.client.last_response.data[:html_url], target: "_blank")}".html_safe
      @test_passage.user.gists.create(question_id: "#{@test_passage.current_question.id}", url: "#{service.client.last_response.data[:html_url]}")
    else
      flash[:notice] = t(".unsuccess")
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
