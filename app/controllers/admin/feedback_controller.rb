class Admin::FeedbackController < Admin::BaseController
  def index; end

  def create
    FeedbackMailer.create(params[:message]).deliver_now
    flash[:notice] = t(".success")
    render :index
  end
end
