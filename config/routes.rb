Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	devise_for :users, controllers: {
		sessions: 'users/sessions'
	}

	root 'items#index'

	resources :items do
		resources :cart_items, only: [:create]
	end
	
	resources :cart_items, :only => [:index, :update, :destroy]
	resources :orders, :only => [:new, :create, :show, :index]
	resources :users, :only => [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
