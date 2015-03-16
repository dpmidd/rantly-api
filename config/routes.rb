Rails.application.routes.draw do

  resources :users do
    resources :rants
  end

  devise_for :users, controllers: { sessions: 'sessions' }
end
