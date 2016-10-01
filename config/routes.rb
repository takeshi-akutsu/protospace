Rails.application.routes.draw do
  devise_for :users #ログイン周りのルーティングを生成するヘルパーメソッド
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :show, :create]
  resources :users, only: [:show, :edit, :update]
end
