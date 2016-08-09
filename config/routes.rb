Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create] #commentsのルーティングのパスの中にコメントに結びつくツイートのidの情報が含まれる
  end
  resources :users, only: [:show]
end
