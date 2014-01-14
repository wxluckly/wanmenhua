Wanmenhua::Application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace "ajax" do
    get "get_client_by_cellphone"
  end

  namespace "admin" do
    root :to => "orders#index"
    resources :cards
    resources :orders
  end
end