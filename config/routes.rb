Rails.application.routes.draw do
  post '/destroy', action: 'destroy', controller: 'profile'
  post '/create', action: 'create', controller: 'profile'
  get '/searchByUser', action: 'getProfileByUser', controller: 'profile'
  get '/fetchProfileByUser', action: 'fetchProfileByUser', controller: 'profile'
  get '/searchRandom', action: 'getProfileRandom', controller: 'profile'
  get '/fetch', action: 'fetch', controller: 'profile'
  get '/storedProfiles', action: 'show', controller: 'profile'
  get '/compare',  action: 'compare', controller: 'profile'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
