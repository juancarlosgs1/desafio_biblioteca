Rails.application.routes.draw do
  # get 'loans/new'
  resources :loans , only: [:new, :create]
  get 'books/index'
  root 'books#index'
  post 'books' , to: 'books#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
