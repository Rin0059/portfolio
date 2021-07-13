Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users/homes#top'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

# ========= 管理者(admin)のルーティング ================
  namespace :admins do
    get '/' => 'homes#top', as: 'top'
    resources :liquors
    resources :genres
    resources :users
  end


 # ========= ユーザー(user)のルーティング ================
  namespace :users do
    get '/about' => 'homes#about'
    resources :liquors do
      get :search, on: :collection # ジャンル検索機能用
      resource :favorites, only: [:create, :destroy]
      resources :liquor_comments, only: [:create, :destroy]
    end
    patch '/users/withdrawal' => 'users#destroy'#会員ステータスの切替(退会)
    get '/users/withdrawal' => 'users#withdrawal'#退会画面への遷移
    resource :users, only:[:show ,:edit,:update]
    resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
  end
end
