class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email,:family_name, :fairst_name,:family_name_kana,:fairst_name_kana,:birthday])
  end

  def after_sign_in_path_for(resource)
    itemes_path
  end

  def after_sign_up_path_for(resource)
    itemes_path
  end

  def after_sign_out_path_for(resource_or_scope)
    itemes_path
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
