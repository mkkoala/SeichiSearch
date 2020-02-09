Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]
  root 'homes#top'
  get 'homes/about'

  resources :meccas do
    resource :mecca_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :movie_tags
end
