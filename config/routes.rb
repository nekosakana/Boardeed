Rails.application.routes.draw do

  get 'homes/top' => 'homes#top'
  get 'homes/about'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :users
    get 'tags' => 'blogs#tag_index'
    resources :games
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  get '/blogs/old' => 'blogs#old_index'
  resources :users
  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    resources :games, only: [:create]
    resources :blog_comments, only: [:create, :destroy]
  end

  get '/blogs/users/:id' => 'blogs#user_index'
  get 'search' => 'blogs#search'
  get 'check/search' => 'blogs#check_search'
  get 'tag/search' => 'blogs#tag_search'
  get '/confirm' => 'users#confirm'

  root 'homes#top'


  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
