Rails.application.routes.draw do  
  namespace :web do
    get 'customer_list/index'
    get 'home/index'
    get 'home/latest_customers'
    get 'home/latest_products'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, :path => "web/auth", controllers: {
    sessions: 'web/auth/sessions',
    confirmations: 'web/auth/confirmations',
    passwords: 'web/auth/passwords',
    registrations: 'web/auth/registrations',
    unlocks: 'web/auth/unlocks',
    omniauth: 'web/auth/omniauth',
  }  

  if Rails.env.development?
    require 'sidekiq/web'    
    require 'sidekiq-scheduler/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  # Defines the root path route ("/")
  root "web/home#index"
end
