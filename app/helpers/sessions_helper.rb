module SessionsHelper
  def login(user)
    user = User.find(user.id)
    self.current_user = user
  end
  def current_user=(user)
    @current_user = user
  end
  def current_user
    @current_user ||= User.where("id = ?", session[:user_id]).first
  end
  def current_user?(user)
    @current_user == user
  end
  def logout
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  def store_location
    session[:return_to] = request.fullpath if request.get?
  end
end
