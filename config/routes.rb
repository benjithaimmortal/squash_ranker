Rails.application.routes.draw do
  root 'dynamic_pages#home'
  get 'dynamic_pages/matchups'
  get 'dynamic_pages/results'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
