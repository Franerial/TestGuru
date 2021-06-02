class FeedbackMailer < ApplicationMailer
  ADMIN_EMAIL = "brugunt@gmail.com"

  def create(message)
    @message = message
    mail to: ADMIN_EMAIL
  end
end
