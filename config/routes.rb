Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/barbershops', to: 'barbershops#index'
  get '/barbershops/:id', to: 'barbershops#show'
  get '/barbers', to: 'barbers#index'
  get '/barbers/:id', to: 'barbers#show'
  get '/barbershops/:id/barbers', to: 'barbershops#barbers'
end
