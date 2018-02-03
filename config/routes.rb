Rails.application.routes.draw do

  scope module: :web do
    get 'welcome/index'
    resources :articles, only: [:index, :show, :destroy, :new, :create, :edit, :update] do
      scope module: :articles do
        resources :comments, only: [:create, :destroy]
      end
    end
    namespace :moderation do
      resources :articles, only: [:edit, :update, :create]
    end
  end

  root 'web/welcome#index'
end
