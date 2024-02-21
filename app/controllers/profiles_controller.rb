class ProfilesController < ApplicationController
    
        def index
          @profiles = Profile.all
        end
      
        def new
          @user=User.find(params[:user_id])
          @profile = Profile.new
        end
      
        def create
          @user=User.find(params[:user_id])
          # @profile = Profile.new(users_id: @user.id,Name: params[:profile][:Name],
          #   User_name: params[:profile][:User_name], Bio: params[:profile][:Bio], 
          #   Gender: params[:profile][:Gender],DOB: params[:profile][:DOB]) 
          @profile = @user.create_profile(profile_params)
          if @profile.save
            flash[:errors] = 'Profile Created Successfully'
            # binding.b
            redirect_to user_profile_path( params[:user_id],@profile.id)
          else
            flash[:error] = @profile.errors.full_messages
            redirect_to root_path
          end
        end
              
        def show
          @user=User.find(params[:user_id])
            @profile = @user.profile
        end
      
        def edit
        
          @profile = Profile.find(params[:id])
    
        end
      
        def update 
          @profile = Profile.find(params[:id])
            if @profile.update(profile_params)
            redirect_to homes_path
            else
                render @profile.errors.full_messages
            end
          end
        def destroy
          begin 
          @profile = Profile.find(params[:id])
           puts params[:user_id]
          if @profile.destroy 
            # binding.b
            @user=User.find(params[:user_id])
            puts @user.email
            if @user.destroy 
               flash[:errors] = 'Account Deleted Successfully'
               redirect_to root_path
            end
          else
            flash[:errors] = @profile.errors.full_messages
            redirect_to homes_path
          end
        end
      rescue =>e
         flash[:error]=e.message
         redirect_to root_path
      end
        private
      
        def profile_params
          params.require(:profile).permit(:Name, :User_name, :Bio, :Gender, :DOB)
        end
end
