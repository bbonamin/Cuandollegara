Whenbus::Application.routes.draw do
  resources :favorites

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :buses, :only => []

  
  get "arrival/select"
  get "arrival/show"
  get "arrival/select_line"
  get "arrival/find_street"
  get "arrival/find_intersection"
  get "arrival/find_stop"
  
  root :to => 'arrival#select'
end
