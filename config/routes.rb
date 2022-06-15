Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 scope :api, defaults: { format: :json } do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }

    resource :user, only: [:update]
    get 'user/auto_login', to: 'users#auto_login'
    get 'users', to: 'users#index'
  end
end
