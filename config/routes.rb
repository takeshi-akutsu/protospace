Rails.application.routes.draw do
  devise_for :users #ログイン周りのルーティングを生成するヘルパーメソッド
  root 'prototypes#index'
  resources :prototypes, except: [:destroy]
  resources :users, only: [:show, :edit, :update]
end
