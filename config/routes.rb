Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :articles, only: %i[show index new create edit update destroy]
  root 'articles#index'
  resources :articles
end
