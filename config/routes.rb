Rails.application.routes.draw do
  root to: 'homes#top'
  # resourcesを使用したルーティング
  resources :menus, except: [:show]
  resources :recipes
  resources :recipe_foods, only: [:new, :create]
  resources :foods, only: [:create]
  resources :settings, only: [:index, :edit, :update]

  # settingsコントローラのルーティング
  get 'settings/:id/delete' => 'settings#delete', as: 'setting_delete'
  delete 'settings/:id' => 'settings#deleted', as: 'setting_deleted'
  get 'settings/contact/:id' => 'settings#contact', as: 'contact'
  post 'settings/contact' => 'settings#send', as: 'send'

  # searchsコントローラのルーティング
  get 'search' => 'searchs#search', as: 'search'

  # customersコントローラのルーティング
  get 'customers/new' => 'customers#new', as: 'customers_new'
  post 'customers' => 'customers#create', as: 'customer'

end