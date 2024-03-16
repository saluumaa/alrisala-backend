class ApplicationController < ActionController::API
        before_action :configure_permitted_parameters, if: :devise_controller?
        include DeviseTokenAuth::Concerns::SetUserByToken
        # include CanCan::ControllerAdditions
        respond_to :json


        protected
        
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name email password password_confirmation role])
        end
end
# Path: app/controllers/application_controller.rb
# Compare this snippet from config/initializers/cors.rb:
# # Be sure to restart your server when you modify this file.
# 
# # Avoid CORS issues when API is called from the frontend app.
# # Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.
# 
# # Read more:

