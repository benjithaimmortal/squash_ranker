Rails.application.routes.draw do


# Homepage
  root              'dynamic_pages#home'

# CRUD Athletes
  get 'index'    => 'athletes#index'
  get 'create'   => 'athletes#create'
  get 'show'     => 'athletes#show'
  get 'edit'     => 'athletes#edit'

# Matchup!
  get 'matchup' => 'athletes#matchup'

# Old
  get 'results'  => 'dynamic_pages#results'

# Enable resources for the Athletes in the database
  resources :athletes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
