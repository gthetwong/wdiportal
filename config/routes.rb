Wdiportal::Application.routes.draw do

  resources :gists, :resources, :events, :projects, :assignments, :labs, :squads

  root :to => "site#home"

  get "site/home", to: "site#home"
  get "site/about", to: "site#about"

  get "/users", to: "users#index"

  devise_for :users

  devise_scope :user do
    get "/users/sign_out", :to => "devise/sessions#destroy"
  end

end
