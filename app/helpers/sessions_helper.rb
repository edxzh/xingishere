module SessionsHelper
  def login(user)
    cookies[:remember_token] = { value: user.remember_token, expires: 1.year.from_now }
    self.current_user = user
  end
  def current_user=(user)
    @current_user = user
  end
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
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
