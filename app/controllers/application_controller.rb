class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  #=====userのストロングパラメーター===========
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sing_up,keys:[:name, :email, :encrypted_password])
    end


  #==========ログイン後の遷移先を指定=============
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_root_path
      else
        root_path
      end
    end


  #==========ログイン後の遷移先を指定=============
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
        root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      end
    end
end
