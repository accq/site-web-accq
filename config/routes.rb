Rails.application.routes.draw do
  devise_for :users
  root 'home#show'
  get '/signez-le-manifeste', to: "home#manifest", as: :manifest
  get '/table-nationale', to: "home#table_nationale", as: :table_nationale
  get '/mission', to: "home#mission", as: :mission
  resources :acrq, controller: :hives , as: :hives do   
  end

  resources :membres, controller: :members, as: :members do
  end

  namespace :admin do
    resources :hives
    root 'home#show'
  end
end
