Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  resources :coins #Essa linha de código faz o rails gerar 7 rotas padrão para usar com o CRUD desse recurso.

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
