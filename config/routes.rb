Rails.application.routes.draw do
  devise_for :users
  get :search, controller: :main

  resources :users do
    member do
      get :user_followers, as: 'followers'
      get :user_chatrooms, as: 'chatrooms'
    end
  end

  patch '/follow', to: 'users#follow', as: 'follow'

  resource :display_chatrooms, only: :show

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resource :friendships do
   delete :destroy
   post :create
  end


  root to: "chatrooms#index"
end
