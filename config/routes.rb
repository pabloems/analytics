Rails.application.routes.draw do
  root to: 'main#home'
  get 'main/analytics'
  resources :articles

end
