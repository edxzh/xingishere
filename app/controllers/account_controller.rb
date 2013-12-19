class AccountController < ApplicationController
  def profile
    @user = current_user
  end
  def advanced
    
  end
end
