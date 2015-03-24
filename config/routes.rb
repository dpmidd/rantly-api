Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', :registrations => "registrations" }, :path => '', :path_names => {:sign_up => 'signup', :sign_in => 'users/sign_in'}
  resources :users
  resources :rants
end
