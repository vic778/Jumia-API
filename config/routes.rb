Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 scope :api, defaults: { format: :json } do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
    resource :user, only: [:update]
    get 'user/auto_login', to: 'users#auto_login'
    get 'users', to: 'users#index'

    resources :categories do
      resources :sub_categories do
        resources :drawers do
          resources :posts
        end
      end
    end

    resources :posts do
      resources :specifications 
    end

    resources :posts do
      resources :boxes
      resources :key_features
    end
   
  end
end
