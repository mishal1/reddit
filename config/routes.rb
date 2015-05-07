Rails.application.routes.draw do

  resources :rooms do
    resources :comments
  end

  root to: "rooms#index"

end
