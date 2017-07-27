Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users do
    resources :recipes, only: [ :show, :new, :create, :edit, :update, :destroy ]
    resources :chows, only: [ :index, :new, :create, :show, :destroy, :update] do
      resources :recipes, only: [:index]
      resources :messages, only: [ :index, :new, :create ]
      resources :calendars, only: [ :new, :create, :show, :edit, :update ]
      resources :badges, only: [ :index, :update ]
    end
    resources :badges, only: [ :new, :create ]
  end

  resources :decisions
  resources :after_signup

  get '/users/:id/chows/:id/messages/refresh_messages', to: 'messages#refresh_messages'
  get 'chows/show'

  get 'recipes/search', to: "recipes#search"

  # post 'users/:user_id/chows/:id', to: 'chows#status_accepted', as: "status_accepted"
  # post 'users/:user_id/chows/:id', to: 'chows#status_rejected', as: "status_rejected"


  #devise_scope :user do

  #end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
