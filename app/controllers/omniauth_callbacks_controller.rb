class OmniauthCallbacksController < ApplicationController

  def twitter
    user = User.twitter_auth request.env["omniauth.auth"]
    sign_in_and_redirect user
  end

  def gplus
    user = User.gplus_auth request.env["omniauth.auth"]
    sign_in_and_redirect user
  end

  
end
