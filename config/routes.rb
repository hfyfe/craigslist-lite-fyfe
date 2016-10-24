Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, :only => [:index,:new,:show,:create] do
    resources :articles
  end

  root 'categories#index'
end
