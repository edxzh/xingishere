class Admin::UsersController < AdminController
  def index
    @users = User.order('id DESC').page(params[:page]).per(10)
  end
end
