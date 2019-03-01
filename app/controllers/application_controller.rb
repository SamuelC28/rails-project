# class ApplicationController < ActionController::Base
#     protect_from_forgery with: :exception
   
#     before_action :current_user
#     before_action :require_logged_in, except: [:new, :create, :home]

#     def logged_in?
#         !!current_user
#     end

#     private
#         def require_logged_in
#             redirect_to root_path unless logged_in?
#         end

#         def current_user
#             @current_user ||= User.find(session[:user_id]) if session[:user_id]
#         end
#         helper_method :current_user
# end
class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    
  
    before_action :redirect_if_not, except: [:home]
    before_action :logged_in?, only: :home
  
    def home
      # binding.pry
    end
  
    def logged_in?
        !!current_user
    end 
  
    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def redirect_if_not
      redirect_to root_path unless logged_in?
    end

    #can be called in any views section
    helper_method :logged_in? 
  end
  