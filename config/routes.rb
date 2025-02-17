Rails.application.routes.draw do
  root "books#index"
  resources :books do
    resources :borrowings, only: [ :create, :update ]
  end
end
