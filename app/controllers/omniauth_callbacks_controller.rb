class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  def google_oauth2
    user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
    if user.persisted?
      flash.notice = "Signed in through Google!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "You are almost Done! Please provide a password to finish setting up your account"
      redirect_to new_user_registration_url
    end
  end
end
