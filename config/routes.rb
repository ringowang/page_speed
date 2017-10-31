Rails.application.routes.draw do
  resources :page_speeds, only: :new do
    collection do
      get :insight
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
