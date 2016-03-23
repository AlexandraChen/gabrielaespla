Rails.application.routes.draw do
  devise_for :users
  root "sites#in_construction"
  get '/home' => 'sites#index'

  devise_scope :user do
    get "/admin", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy", as: :signout
  end

  get "/admin/panel"          => "users#admin_panel"
  get "/textos"               => "texts#all_texts"
  get "/obras"                => "pieces#all_pieces"
  get "/obras/dibujos"        => "pieces#all_drawings"
  get "/obras/murales"        => "pieces#all_murals"
  get "/obras/pinturas"       => "pieces#all_paintings"
  get "/obras/performances"   => "pieces#all_performances"
  get "/proyectos"            => "projects#all_projects"

  resources :texts, except: [:destroy]
  resources :photos, except: [:destroy]
  resources :pieces, except: [:destroy]
  resources :projects, except: [:destroy]

end
