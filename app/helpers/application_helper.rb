module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

   def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id]
  end

  def authenticate_user
  	unless current_user
	    redirect_to new_session_path
	  end
  end 
  
end
