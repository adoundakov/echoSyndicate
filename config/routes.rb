Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#root"
  namespace :api, defaults: { format: :json } do
    resources :articles, only: [:index, :show, :update, :destroy, :create]
    get 'get_articles/:limit/:offset', to: 'articles#get_articles'
  end

  mount Crono::Web, at: '/crono'
end
