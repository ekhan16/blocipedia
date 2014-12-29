Rails.application.routes.draw do
  get 'index' => 'welcome#index'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
