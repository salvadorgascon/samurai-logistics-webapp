Rails.application.routes.draw do  
  namespace :web do
    get 'home/index'
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

  # Defines the root path route ("/")
  root "web/home#index"
end
