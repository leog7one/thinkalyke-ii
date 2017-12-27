class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def facebook 
    @thinker = Thinker.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @thinker
  end

end