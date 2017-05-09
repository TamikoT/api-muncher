Rails.application.routes.draw do
  root 'recipes#home'
  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:page', to: 'recipes#index', defaults: {page: 1}
  get '/recipes/:index', to: 'recipes#show', as: 'recipe'
end
