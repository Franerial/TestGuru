class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:id])
    result = GistQuestionService.new(test_passage.current_question).call

    if result.success?
      flash[:notice] = "#{t(".success")} #{view_context.link_to(t(".find_here"), result.url, target: "_blank")}".html_safe
      test_passage.user.gists.create!(question_id: test_passage.current_question.id, url: result.url)
    else
      flash[:notice] = t(".unsuccess")
    end
    redirect_to test_passage
  end
end
