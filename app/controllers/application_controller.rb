class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pagy::Backend
    Pagy::DEFAULT[:items] = 5

    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def authorize_request(kind = nil) 
        if current_user
            unless kind.include?(current_user.role)
                redirect_to products_path, notice: "You are not authorized to perform this action" 
            end 
        else
            redirect_to products_path, notice: "You are not authorized to perform this action" 
        end
    end
end
