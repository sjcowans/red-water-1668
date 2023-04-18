Rails.application.routes.draw do
  resources :dishes, only: [:show] do
    resources :dishingrediants, only: [:create] 
  end

  resources :chefs, only: [:show] do
    resources :ingrediants, only: [:index]
  end
end
