# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'customer_signup', to: 'customer_signup#create'
      post 'customer_login', to: 'customer_sessions#create'
      post 'customer_logout', to: 'customer_sessions#destroy'
    end
  end
end