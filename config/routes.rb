Rails.application.routes.draw do
  root 'recipes#index'
  get '/search', to: 'recipes#search', as: 'search'
  get '/recipes', to: 'recipes#index', as: 'recipes'
end
