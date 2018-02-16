Rails.application.routes.draw do
	devise_for :users, controllers: {
		sessions: 'users/sessions'
	}

	root 'items#index'

	resources :items
	
	resources :cart_items, :only => [:index, :create, :update, :destroy]
	resources :orders, :only => [:create, :show, :index]
	resources :users, :only => [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
