Rails.application.routes.draw do
  resources :dishes, only: [:show] do
    resources :dishingrediants, only: [:create] 
  end
end
