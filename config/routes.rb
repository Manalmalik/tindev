Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/video-page', to: 'pages#videocall'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tickets
end
