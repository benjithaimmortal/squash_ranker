Rails.application.routes.draw do


# Homepage
  root              'dynamic_pages#home'

# Create and view Athletes
  get 'index'    => 'athletes#index'
  get 'create'   => 'athletes#create'
  get 'show'     => 'athletes#show'
  get 'edit'     => 'athletes#edit'

# Choose from matchups, view resulting data
  get 'matchups' => 'dynamic_pages#matchups'
  get 'results'  => 'dynamic_pages#results'

# Enable resources for the Athletes in the database
  resources :athletes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
