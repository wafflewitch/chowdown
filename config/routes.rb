Rails.application.routes.draw do
  get 'users/new'

  get 'users/edit'

  get 'users/show'

  get 'users/create'

  get 'users/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
