class AuthenticationController < ApplicationController

 skip_before_action :authenticate_request

#  def index

# render json: @distributors
#  end
 def authenticate

   command = AuthenticateUser.call(params[:email], params[:password])
   user = User.find_by_email(params[:email])

   if command.success?
    
     render json: { auth_token: command.result,user_id: user.id}

   else

     render json: { error: command.errors }, status: :unauthorized

   end

 end

end