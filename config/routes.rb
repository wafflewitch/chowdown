Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users do
    resources :chows, only: [ :index, :new, :create, :show, :destroy] do
      resources :messages, only: [ :index, :new, :create ]
      resources :calendars, only: [ :new, :create, :show, :edit, :update ]
    end
    resources :badges, only: [ :new, :create, :index ]
    resources :preferences, only: [ :new, :create, :edit, :update, :index ]
  end

  get 'chows/show'
  post 'users/:user_id/chows/:id', to: 'chows#status_accepted', as: "status_accepted"
  post 'users/:user_id/chows/:id', to: 'chows#status_rejected', as: "status_rejected"


  #devise_scope :user do

  #end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
