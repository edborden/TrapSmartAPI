Rails.application.routes.draw do
	resources :sessions, only: [:create, :index, :destroy]
	resources :message, only: :create
	resources :system_status, only: :index
	resources :companies, only: [:create,:update,:index]
	resources :users, only: [:create,:update]
	resources :traps, only: [:create,:update]
	resources :notifications, only: [:create,:destroy]
end
