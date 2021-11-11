class SessionsController < ApplicationController
 # include AuthHelper

    def create
     # binding.pry
        
        @user = User.find_by(username: session_params[:username])
  
        if @user && @user.authenticate(session_params[:password])
       
          login!
          
          render json: {
            status: :created,
            logged_in: true,
            user: @user
          }
        else
          render json: { 
            status: 401,
            errors: ['no such user, please try again']
          }
        end
    end

    def is_logged_in?
      #binding.pry
        if logged_in? && current_user
            render json: {
              logged_in: true,
              user: current_user
            }
          else
            render json: {
              logged_in: false,
              message: 'no such user'
            }
          end
    end

    def destroy
      #binding.pry
        logout!
        user = nil
        reset_session
        render json: {
          status: 200,
          logged_out: true,
          logged_in: false
        }
    end

    private

    def session_params
        params.require(:session).permit(:session, :username, :email, :password)
    end

    def auth
      request.env['omniauth.auth']
    end

end