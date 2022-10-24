class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    # sign up 時に name カラムにデータを保存することを許可する
    # sign in の認証キーを email から name に変更するため，email も許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
