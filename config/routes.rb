Rails.application.routes.draw do
  root to: "root#index"

  resources :schools, only: [:index, :show, :new, :create, :destroy]

  resources :players, only: [:create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :schools, only: :show do
      resources :players, only: :index
    end
  end
end
