class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
   @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    
    if !logged_in?
      
      flash[:danger] = "Você precisa estar logado para ter acesso a esta ação"
      redirect_to root_path
  
    end
  
  end
  
end
