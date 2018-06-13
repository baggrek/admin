class AuthenticationController < ApiController
   # return auth token once user is authenticated
   skip_before_action :authorize_request, only: :authenticate
   def authenticate
       auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
       response = { status: :OK, auth_token: auth_token, errors: nil  }
       render json: response
       #json_response(auth_token: auth_token)
   end

   private

   def auth_params
       params.permit(:email, :password)
   end
end
