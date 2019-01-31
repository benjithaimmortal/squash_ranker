Rails.application.routes.draw do
  root              'dynamic_pages#home'
  get 'matchups' => 'dynamic_pages#matchups'
  get 'results'  => 'dynamic_pages#results'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
