Rashnu::Application.routes.draw do |map|
  devise_for :users

  resources :users

end
