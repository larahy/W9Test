def login
  user = create(:user)
  login_as(user)
end