Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'  
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end

  
  # onlyオプションを使用することで、生成するルーティングを限定することができます。
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


# new(投稿を作成する画面)
# show(投稿の詳細画面)
# index(投稿の一覧画面)
# edit(投稿の編集画面)
# create(投稿作成)
# destroy(投稿削除)
# update(投稿更新)
