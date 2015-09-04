Rails.application.routes.draw do
  devise_for :users
  root 'home#show'
  get '/signez-le-manifeste', to: "home#manifest", as: :manifest
  get '/table-nationale', to: "home#table_nationale", as: :table_nationale
  get '/mission', to: "home#mission", as: :mission
  get '/mission/notre-vision', to: "home#vision", as: :notre_vision
  get '/mission/notre-moyen', to: "home#moyen", as: :notre_moyen
  get '/mission/nos-objectifs', to: "home#objectifs", as: :nos_objectifs
  resources :acrq, controller: :hives , as: :hives do   
  end

  resources :membres, controller: :members, as: :members do
  end

  namespace :admin do
    resources :hives
    root 'home#show'
  end
end
