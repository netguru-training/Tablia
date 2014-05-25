class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  expose(:categories) { Category.all }
  expose_decorated(:sponsored_advertises, decorator: AdvertiseDecorator) { Advertise.all.select(&:sponsored?).sample(3) }

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def home
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:account_update) << :last_name
      devise_parameter_sanitizer.for(:account_update) << :avatar
    end
end
