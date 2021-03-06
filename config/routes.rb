Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  post 'file', to: 'products#process_file'

  resources :products, only: %i[edit update]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: [:index, :show, :update, :create, :destroy]
    end
  end
end
