Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 resources :categories, only: [:index, :show] do
    resources :tickets do
      collection do
        get :filtered
      end
      get '/video-page', to: 'pages#videocall'
      resources :chats, only: [:show, :create] do
        resources :messages, only: [:create]
      end
    end
  end
  resources :users, only: [] do
    resources :user_informations, only: [:new, :create, :show]
    resources :tickets, only: [:show]
  end

  resources :user_informations, only: [:update]

  resources :chats, only: [:index]

end
