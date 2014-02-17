Wanmenhua::Application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :contact, only: :index
  resources :home, only: :index
  resources :info
  resources :news
  resources :project_description, only: :index
  resources :welcome, only: :index

  namespace "ajax" do
    get "get_client_by_cellphone"
    post "set_order_squad"
    post "set_order_card_sn"
  end

  namespace "admin" do
    root :to => "orders#index"
    resources :cards
    resources :infos
    resources :orders
  end
end