Rails.application.routes.draw do
  root 'recipes#index'
  get '/recipes/search', to: 'recipes#search', as: 'search'
  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:index', to: 'recipes#show', as: 'recipe'
end
