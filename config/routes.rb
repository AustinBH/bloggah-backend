Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # Routes go here
      resources :user
      resources :post
      resources :comment
    end
  end
end
