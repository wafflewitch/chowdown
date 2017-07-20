Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users do
    resources :chows, only: [ :index, :new, :create, :show, :destroy ] do
      resources :messages, only: [ :index, :new, :create ]
      resources :calendars, only: [ :new, :create, :show, :edit, :update ]
    end
    resources :badges, only: [ :new, :create, :index ]
    resources :preferences, only: [ :new, :create, :edit, :update, :index ]
  end

  get '/users/:id/chows/:id/messages/refresh_messages', to: 'messages#refresh_messages'
  get 'chows/show'

  #devise_scope :user do

  #end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
