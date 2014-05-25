class MessageMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_message_to_user_about_ad(user, advertise, current_user, body)
    @user = user
    @email_with_name = "#{@user.name} <#{@user.email}>"
    @advertise = advertise
    @body = body
    @current_user = current_user
    mail(from: current_user.email, to: @email_with_name, subject: "User #{current_user.name} sent you a message about your #{advertise.title}!")
  end
end
