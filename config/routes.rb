Wanmenhua::Application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace "admin" do
    root :to => "welcome#index"
    resources :order
  end
end