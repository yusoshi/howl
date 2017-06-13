Rails.application.routes.draw do
  devise_for :users
  root 'feeds#index'
end
