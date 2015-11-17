def login(user)
  visit login_path
  fill_in 'email',            with: user.email
  fill_in 'password',         with: user.password
  click_button '登录'
end
