Rashnu::Application.routes.draw do |map|
  devise_for :users, :as => :auth, :path_names => {
    :sign_in  => 'login',
    :sign_out => 'logout',
    :sign_up  => 'register'
  }, :controllers => {
    :sessions => "sessions",
    :registrations => "registrations"
  }

  root :to => 'users#index'

end

