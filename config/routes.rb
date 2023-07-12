Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/barbershops', to: 'barbershops#index'
  get '/barbershops/new', to: 'barbershops#new'
  get '/barbershops/:id', to: 'barbershops#show'
  get '/barbers', to: 'barbers#index'
  get '/barbers/:id', to: 'barbers#show'
  get '/barbershops/:id/barbers', to: 'barbershops/barbers#index'
  post '/barbershops', to: 'barbershops#create'
  get '/barbershops/:id/edit', to: 'barbershops#edit'
  patch '/barbershops/:id', to: 'barbershops#update'
  get '/barbershops/:id/barbers/new', to: 'barbershops/barbers#new'
  post '/barbershops/:id/barbers/new', to: 'barbers#create'
  get '/barbers/:id/edit', to: 'barbers#edit'
  patch '/barbers/:id', to: 'barbers#update'
end
