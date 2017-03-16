Rails.application.routes.draw do
  root to: 'welcome#index'

  mount RailsAdmin::Engine => '/cms', as: 'rails_admin'
  resources :images
  resources :charges
  devise_for :users
end
