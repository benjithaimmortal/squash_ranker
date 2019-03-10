Rails.application.routes.draw do

# Homepage
  root              'dynamic_pages#home'

# CRUD Athletes
  get 'index'     => 'athletes#index'
  get 'create'    => 'athletes#create'
  get 'show'      => 'athletes#show'
  get 'edit'      => 'athletes#edit'

  # Enable resources for the Athletes in the database,
  # including PUT methods for incrementing Positive and Negative
  resources :athletes do
    member do
      put 'rating_up', 'tossup'
    end
  end

# Matchup!
  get 'matchup' => 'athletes#matchup'

# Deprecated Results
  get 'results'  => 'dynamic_pages#results'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
