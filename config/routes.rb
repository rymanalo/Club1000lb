Club1000lb::Application.routes.draw do
  resources :squat_data_points


  resources :deadlift_data_points


  devise_for :users

  root :to => 'club1000lb#index'

end
