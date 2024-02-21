class SessionsController < ApplicationController
   
    def new
        @user = User.new
      end
      def create
        @user = User.find_by(email: params[:user][:email])
        # puts "#{session[:user_id]}"
        if @user.present? && @user.authenticate(params[:user][:password]) 
          session[:user_id] = @user.id #,  flash: { success: 'Logged in successfully' }
          redirect_to homes_path
        else
          flash[:error]="Login failled"
           redirect_to sessions_path
        end
      end
end
