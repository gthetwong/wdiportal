Wdiportal::Application.routes.draw do

  resources :gists, :resources, :events, :projects, :assignments, :labs

  root :to => "site#home"

  get "site/home", to: "site#home"
  get "site/about", to: "site#about"

end
