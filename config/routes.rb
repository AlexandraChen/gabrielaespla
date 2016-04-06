Rails.application.routes.draw do
  devise_for :users
  root "sites#index"

  devise_scope :user do
    get "/admin", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy", as: :signout
  end

  get "/admin/panel"          => "users#admin_panel"
  get "/textos"               => "texts#all_texts"
  get "/obras"                => "pieces#all_pieces"
  get "/obras/dibujos"        => "pieces#drawings"
  get "/obras/murales"        => "pieces#murals"
  get "/obras/pinturas"       => "pieces#paintings"
  get "/obras/performances"   => "pieces#performances"
  get "/proyectos"            => "projects#all_projects"
  get "/bio"                  => "sites#bio"
  get "/contactame"           => "sites#contact_me"       

  resources :texts, except: [:destroy]
  resources :photos, except: [:destroy]
  resources :pieces, except: [:destroy]
  resources :projects, except: [:destroy]
  resources :contact_forms, only: [:new, :create]

end
