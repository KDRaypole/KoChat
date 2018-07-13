Rails.application.routes.draw do
  devise_for :users
  resources :users
  patch '/follow', to: 'users#follow', as: 'follow'

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
