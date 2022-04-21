Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :vi do
      resources :users do
        resources :facts
      end

    end
  end
end
