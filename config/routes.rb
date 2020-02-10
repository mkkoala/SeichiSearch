Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]

  resources :meccas do
    resource :mecca_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :movie_tags

  root 'homes#top'
  get 'homes/about'
  get 'meccas/movie_tag/:movie_tag_id', to:'meccas#index', as:'meccas_movie_tags'


end
