class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
    before_action :configure_sign_in_params, only: [:create]

  
    def create
      super do |resource|
        if resource.admin?
          render json: { user: resource, role: resource.role, message: 'Admin login' }, status: :ok
          return
        end
      end
    end
  
    def render_create_success
      render json: { message: 'Login success' }, status: :ok
    end
  
    def render_create_error_bad_credentials
      render json: { message: 'Bad credentials' }, status: :unauthorized
    end
  
    def render_destroy_success
      render json: { message: 'Logout success' }, status: :ok
    end
  
    def render_destroy_error
      render json: { message: 'Logout error' }, status: :unauthorized
    end
  
    private
  
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :role])
    end
  end
  