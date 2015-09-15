Rails.application.routes.draw do
  devise_for :users
  root 'home#show'
  get '/signez-le-manifeste', to: "home#manifest", as: :manifest
  get '/table-nationale', to: "home#table_nationale", as: :table_nationale
  get '/noyau-central', to: "home#noyau_central", as: :noyau
  get '/mission', to: "home#mission", as: :mission
  get '/mission/notre-vision', to: "home#vision", as: :notre_vision
  get '/mission/notre-moyen', to: "home#moyen", as: :notre_moyen
  get '/mission/nos-objectifs', to: "home#objectifs", as: :nos_objectifs
  get '/education/bibliotheque', to: "home#bibliotheque", as: :bibliotheque
  get '/education/mediatheque', to: "home#mediatheque", as: :mediatheque
  get '/medias/couverture-mediatique', to: "home#media_coverage", as: :media_coverage
  get '/medias/communiques-de-presse', to: "home#press_releases", as: :press_releases
  resources :acrq, controller: :hives , as: :hives do   
  end

  resources :membres, controller: :members, as: :members do
  end

  namespace :admin do
    resources :hives
    resources :media_coverage_items
    resources :members do
      member do
        put :approve
        put :disapprove
      end
    end
    root 'home#show'
  end
end
