Rails.application.routes.draw do

  scope module: :web do
    get 'welcome/index'
    resources :articles, only: [:index, :show, :destroy, :new, :create] do
      scope module: 'articles' do
        resources :comments, only: [:create, :destroy]
      end
    end
    scope module: 'moderation' do
      resources :articles, only: [:edit, :update]
    end
  end

  root 'web/welcome#index'
end
