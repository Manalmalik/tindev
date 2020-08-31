Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/video-page', to: 'pages#videocall'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :tickets do
      collection do
        get :filtered
      end
    end
  end
  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end
  resources :users, only: [] do
    resources :chats, only: [:create, :index] do
    end
   resources :userinformations, only: [:new, :create]
  end
end
