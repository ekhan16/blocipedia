Rails.application.routes.draw do
  devise_for :users
  get 'index' => 'welcome#index'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
