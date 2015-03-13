Rails.application.routes.draw do

	resources :message, only: :create
	resources :system_status, only: :index

end
