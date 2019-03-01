class UsersController < ApplicationController
    skip_before_action :redirect_if_not, only: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new users_params
  
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error_signup] = @user.errors.full_messages
        redirect_to new_user_path
      end
    end
  
    def show
      @user = User.find_by(id: params[:id])
      redirect_to signin_session_path unless @user
    end
  
    private  
        def users_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end 
  







# class UsersController < ApplicationController
    
#     def index
#         #automatically redirect to index.html.erb
#     end

#     def create
#         @user = User.new users_params
#         # user.save
#         # user.inspect
#         if @user.save
#             # user.inspect
#             session[:user_id] = @user.id 
#             redirect_to '/dashboard'
#         else
#             flash[:error_register] = user.errors.full_messages
#             redirect_to '/'
#         end
#     end

#     private
#         def users_params
#            params.require(:user).permit(:name, :email, :password, :password_confirmation)
#         end

# end
