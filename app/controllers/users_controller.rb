class UsersController < ApplicationController

    def new 
      @user = User.new
    end

    def create
        @user = User.new(allowparam)

        if @user.save
        redirect_to new_user_profile_path(@user.id) , notice: "Successfully Sign Up"
        else
            render json: {error: @user.errors.full_messages}
        end
    end
    private

    def allowparam
        params.require(:user).permit(:email,:password,:password_confirmation)
    end
end
