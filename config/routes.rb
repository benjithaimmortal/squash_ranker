Rails.application.routes.draw do

# Homepage
  root              'dynamic_pages#home'

# Create and view Athletes
  get 'create'   => 'athletes#create'
  get 'view'     => 'athletes#view'

# Choose from matchups, view resulting data
  get 'matchups' => 'dynamic_pages#matchups'
  get 'results'  => 'dynamic_pages#results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
