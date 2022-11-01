Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  # コメントは book に対してされるため，book_comments は books に結びつく
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    # singular にすると URL に id が含まれなくなる
    # 1ユーザに対して1いいねしかできないため，destroy する際に favorite の id が必要ない
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]

  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
