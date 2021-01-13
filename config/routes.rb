Rails.application.routes.draw do
  #home
  get "/" => "home#top"
  get "about" => "home#about"

  #users
  get 'users/signup' => "users#signup"
  get 'users/:id/show' => "users#show"
  get 'users/login' => "users#login_form"
  post "users/login" => "users#login"
  post "users/logout" => "users#logout"
  get 'users/:id/edit' => "users#edit"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"

  #opinions
  get 'opinions/show' => "opinions#show"
  
  #themes
  get 'themes/index' => "themes#index"
  get "themes/show" => "themes#show"

  #theme_follows
  post 'thme_follows/create' => "thme_follows#create"

  #opinion_klikes
  post 'opinion_likes/create' => "opinion_likes#create"
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  



end
