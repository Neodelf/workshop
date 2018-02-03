Rails.application.routes.draw do

  scope module: :web do
    get 'welcome/index'
    resources :articles do
      scope module: 'articles' do
        resources :comments, only: [:create, :destroy]
      end
    end
  end

  root 'web/welcome#index'
end
