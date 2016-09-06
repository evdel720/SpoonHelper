Rails.application.routes.draw do
  root 'static_pages#root'
  get 'api/recipes/search', to: 'api/recipes#search'
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create, :update]
    resources :categories, only: :index
    resources :recipes, except: [:new, :edit]
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
