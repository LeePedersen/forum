Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  devise_for :users
  # devise_scope :users do
    get '/users', :to => 'users#index'
    # registrations to: 'registrations#index'
  # end
  resources :posts do
    resources :comments, except: :show
  end
end
