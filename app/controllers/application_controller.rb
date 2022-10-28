class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # sign in 後のパス指定
  def after_sign_in_path_for(resource)
    root_path
  end

  # sign out 後のパス指定
  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    # sign up 時に name カラムにデータを保存することを許可する
    # sign in の認証キーを email から name に変更するため，email も許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
