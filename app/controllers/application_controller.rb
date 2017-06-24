class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

# サインアップ時にnameカラムの登録を許可
# emailなしでサインイン可能にする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, :name, :password, :remember_me)
  end
end
