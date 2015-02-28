Rails.application.routes.draw do

  resources :users do
    resources :rants
  end
end
