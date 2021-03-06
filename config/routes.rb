Rails.application.routes.draw do

    devise_for :users, :controllers => {
      :registrations => "registrations"
    }
    resources :users, only: [:show, :index, :destroy] do
      member do
        get :following, :followers
      end
    end
    resources :microposts, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]

  root 'home#home'
  get 'help' => 'home#help'
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
