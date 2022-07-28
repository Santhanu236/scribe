Rails.application.routes.draw do
  root "home#login"
  get "/signup", to: "home#signup"
  get "/logout", to: "session#logout"

  get "/home", to: "home#home"
  get "/my_blogs", to: "home#my_blogs"
  get "/saved", to: "home#saved"
  get "/my_account", to: "home#my_account"
  get "/new_post", to: "home#new_blog"
  post "/create_new_blog", to: "blog#create_new_blog"
  post "/update_user", to: "users#update_user"

  get "/save_blog/:save_id", to: "blog#save_blog", as: :save_id
  get "/delete_saved_blog/:del_id", to: "blog#delete_saved", as: :del_id

  match "/create_new_user", :to => "users#create_user", :via => :post
  match "/to_login_handler", :to => "session#login_handler", :via => :post
end
