Rails.application.routes.draw do
  root "sites#in_construction"
  get '/home' => 'sites#index'
end
