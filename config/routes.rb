Rails.application.routes.draw do
  root 'blogs#index'
  resources :gears
  resources :labels



  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update]

  resources :teams do
    resources :travel_plans do
      resources :comments, shallow: true 
    end
    resources :assigns, only: %w(create destroy)
  end

  # resources :travel_plans do
  #   resources :chats
  # end

  resources :blogs do
    collection do
      get 'search'
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
