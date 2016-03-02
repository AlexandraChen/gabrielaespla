Rails.application.routes.draw do
  devise_for :users
  root "sites#in_construction"
  get '/home' => 'sites#index'
end
