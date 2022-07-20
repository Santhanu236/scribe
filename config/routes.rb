Rails.application.routes.draw do
  root "home#login"
  get "/signup", to: "home#signup"
  get "/logout", to: "session#logout"

  get "/home", to: "home#home"
  get "/my_blogs", to: "home#my_blogs"
  get "/saved", to: "home#saved"
  get "/my_account", to: "home#my_account"

  match "/create_new_user", :to => "users#create_user", :via => :post
  match "/to_login_handler", :to => "session#login_handler", :via => :post
end
