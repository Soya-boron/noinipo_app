Rails.application.routes.draw do
  #home
  get "/" => "home#top"
  get "about" => "home#about"

  #users
  get 'users/signup' => "users#signup"
  get 'users/:id/show' => "users#show"
  get "users/:id/show_followthemes" => "users#show_followthemes"
  get "users/:id/show_likeopinions" => "users#show_likeopinions"
  get 'users/login' => "users#login_form"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  get 'users/:id/edit' => "users#edit"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"

  #opinions
  get "opinions/:id/create" => "opinions#create_form"
  post "opinions/:id/create" => "opinions#create"
  post "opinions/:id/destroy" => "opinions#destroy"
  get 'opinions/:id/show' => "opinions#show"
  get "opinions/:id/edit" => "opinions#edit"
  post "opinions/:id/update" => "opinions#update"
  
  #theme_follows
  post "/theme_follows/:user_id/:theme_id/create" => "theme_follows#create"
  post "/theme_follows/:user_id/:theme_id/destroy" => "theme_follows#destroy"

  #themes
  get "themes/create" => "themes#create_form"
  post "themes/create" => "themes#create"
  get 'themes/index' => "themes#index"
  get "themes/:id/show" => "themes#show"
  get "themes/search" => "themes#search"

  #opinion_likes
  post "/opinion_likes/:user_id/:opinion_id/create" => "opinion_likes#create"
  post "/opinion_likes/:user_id/:opinion_id/destroy" => "opinion_likes#destroy"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  



end
