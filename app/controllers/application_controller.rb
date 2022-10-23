class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    # sign up 時に name カラムにデータを保存することを許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
