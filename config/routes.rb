Rails.application.routes.draw do

  devise_for :users
  resources :rooms do
    resources :comments
  end

  root to: "rooms#index"

end
