Rails.application.routes.draw do
  resources :ducks, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :students, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
