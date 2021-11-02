class SessionsController < ApplicationController

    def create
      
      if auth
        @user = User.find_by(uid: auth['uid'])
        if !!@user
          @user = User.new
          @user.uid = auth['uid']
          @user.username = auth['info']['name']
          @user.email = auth['info']['email']
          @user.password = auth['uid']
          @user.password_confirmation = auth['uid']

          if @user.save
            session[:user_id] = @user.id
          end

        else
          session[:user_id] = @user.id
        end
        binding.pry
      end


        @user = User.find_by(username: session_params[:username])
  
        if @user && @user.authenticate(session_params[:password])
          login!
          render json: {
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
        logout!
        render json: {
          status: 200,
          logged_out: true
        }
    end

    private

    def session_params
        params.permit(:username, :email, :password)
    end

    def auth
      request.env['omniauth.auth']
    end

end