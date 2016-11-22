Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :articles
  end

  mount Crono::Web, at: '/crono'
end
