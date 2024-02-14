Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  resources :post_images, only: [:new, :create, :index, :show]

  get 'homes/about', to: 'homes#about', as: 'about'
  # onlyオプションを使用することで、生成するルーティングを限定することができます。
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# new(投稿を作成する画面)
# show(投稿の詳細画面)
# ndex(投稿の一覧画面)
# edit(投稿の編集画面)
# create(投稿作成)
# destroy(投稿削除)
# update(投稿更新)
