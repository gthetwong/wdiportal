Wdiportal::Application.routes.draw do

  resources :gists, :resources, :events, :projects, :assignments, :labs, :squads

  root :to => "site#home"

  get "/users/:id/role", to: "users#form", as: :role_form
  patch "/users/:id/role", to: "users#change_role", as: :change_role

  get "/events/:id/rsvp", to: "events#rsvp", as: :rsvp

  get "site/home", to: "site#home"
  get "site/about", to: "site#about"

  get "/users", to: "users#index"

  devise_for :users

  devise_scope :user do
    get "/users/sign_out", :to => "devise/sessions#destroy"
  end



end
