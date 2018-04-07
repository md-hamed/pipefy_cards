Rails.application.routes.draw do
  resources :cards, only: [:index]
  resources :organizations, only: [] do
    get :import, on: :collection
  end

  root 'cards#index'
end
