Club1000lb::Application.routes.draw do
  resources :deadlift_data_points


  devise_for :users

  root :to => 'club1000lb#index'

end
