Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/cms', as: 'rails_admin'
  resources :images
  resources :charges
  devise_for :users
  root to: 'rails_admin/main#dashboard'
end
