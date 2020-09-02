Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 resources :categories, only: [:index, :show] do
    resources :tickets do
      collection do
        get :filtered
      end
      resources :chats, only: [:show, :create] do
        get '/video', to: 'pages#videocall'
        resources :messages, only: [:create]
      end
    end
  end
  resources :users, only: [:show], to: 'user_informations#show' do
    resources :user_informations, only: [:new, :create]
  end

  resources :user_informations, only: [:update, :edit]

  resources :chats, only: [:index]

end
