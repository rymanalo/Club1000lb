Club1000lb::Application.routes.draw do
  devise_for :users

  root :to => 'club1000lb#index'

end
