Rails.application.routes.draw do
  devise_for :users
  get :search, controller: :main
  resources :users
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
