# frozen_string_literal: true
Rails.application.routes.draw do
  root 'home#login'
  get '/signup', to: 'home#signup'
  get '/logout', to: 'session#logout'
  get '/home', to: 'home#home'
  get '/my_blogs', to: 'home#my_blogs'
  get '/saved', to: 'home#saved'
  get '/my_account', to: 'home#my_account'
  get '/new_post', to: 'home#new_blog'

  get '/forgot_pw', to: 'users#fpw_page'
  post '/generate_otp', to: 'users#generate_otp'
  post '/match_otp', to: 'users#match_otp'
  post '/reset_pw', to: 'users#reset_password'

  get '/view_user/:vuid', to: 'home#user_page', as: :vuid
  get '/view_blog/:vbid', to: 'home#blog_page', as: :vbid
  get '/edit_blog/:eblog_id', to: 'home#edit_blog', as: :eblog_id

  post '/search_blogs', to: 'blog#search_blogs'
  post '/search_category', to: 'blog#search_category'

  post '/create_new_blog', to: 'blog#create_new_blog'
  get '/delete_blog/:del_blog_id', to: 'blog#delete_blog', as: :del_blog_id
  post '/update_user', to: 'users#update_user'
  post '/create_comment', to: 'blog#create_comment'
  post '/update_blog', to: 'blog#update_blog'
  get '/save_blog/:save_id', to: 'blog#save_blog', as: :save_id
  get '/delete_saved_blog/:del_save_id', to: 'blog#delete_saved', as: :del_save_id
  get '/like_blog/:like_id', to: 'blog#like_blog', as: :like_id
  get '/delete_liked_blog/:del_like_id', to: 'blog#delete_liked', as: :del_like_id

  match '/create_new_user', to: 'users#create_user', via: :post
  match '/to_login_handler', to: 'session#login_handler', via: :post

  get '/follow_user/:fol_usr_id', to: 'relationship#create_relationship', as: :fol_usr_id
  get '/unfollow/:unfol_id', to: 'relationship#del_relationship', as: :unfol_id

  get '/feedback', to: 'home#feedback'
  post '/submit_feedback', to: 'home#submit_feedback'
end
