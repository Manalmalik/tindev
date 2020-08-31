Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :categories, only: [:index, :show] do
    resources :tickets do
      get '/video-page', to: 'pages#videocall'
      resources :chats, only: [:show, :create] do
        resources :messages, only: [:create]
      end
    end
  end
  resources :chats, only: [:index]

end
