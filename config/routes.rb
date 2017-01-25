Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      namespace 'merchants' do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      namespace 'items' do
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
        get 'random', to: 'random#show'
      end
      namespace 'transactions' do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      namespace 'invoices' do
        get 'random', to: 'random#show'
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
      end
      namespace 'customers' do
        get 'random', to: 'random#show'
      end
      resources 'invoices', only: [:index, :show]
      resources 'customers', only: [:index, :show]
      resources 'merchants', only: [:index, :show]
      resources 'transactions', only: [:index, :show]
      resources 'items', only: [:index, :show]
    end
  end
end
