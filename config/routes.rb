Rails.application.routes.draw do
  get  '/inquiry', to: 'inquiries#new'
  post '/inquiry', to: 'inquiries#create'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/about', to: 'homes#about'
  get '/news', to: 'homes#news'
  #resources :homes
  namespace :admin do
    resources :users
  end
  root to: 'notes#index'
  resources :notes
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
