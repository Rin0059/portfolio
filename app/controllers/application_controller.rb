class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  #=====userのストロングパラメーター===========
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
    end


  #==========ログイン後の遷移先を指定=============
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admins_top_path
      else
        root_path
      end
    end


  #==========ログアウト後の遷移先を指定=============
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :user
        root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      end
    end
end
