module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    # ログインしているユーザー情報
    if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def logged_in?
    current_user.present?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def store_url
    session[:forwarding_url] = request.original_url
  end
  
  def redirect_to_stored_url(user)
    redirect_to session[:forwarding_url] || user
    session.delete(:forwarding_url)
  end
end
