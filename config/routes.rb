Rails.application.routes.draw do
  devise_for :users #ログイン周りのルーティングを生成するヘルパーメソッド
  root 'prototypes#index'

  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show]
  resources :popular, only: [:index]
  resources :newest, only: [:index]
end
