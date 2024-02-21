class HomesController < ApplicationController
    def index
        
    end
    def show
        binding.b
        @user=User.find(params[:user_id])
        @profile = Profile.find(session[:user_id])
    end
end
