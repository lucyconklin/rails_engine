Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      namespace 'merchants' do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get 'revenue', to: 'revenue#index'
        get ":id/items", to: 'items#index'
        get ":id/invoices", to: 'invoices#index'
        get ':id/revenue', to: 'revenue#show'
      end
      namespace 'items' do
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
        get 'random', to: 'random#show'
        get ':id/best_day', to: 'best_day#show'
        get ':id/invoice_items', to: 'invoice_item#index'
        get ':id/merchant', to: 'merchant#show'
      end
      namespace 'transactions' do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get ':id/invoice', to: 'invoices#show'
      end
      namespace 'invoices' do
        get 'random', to: 'random#show'
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
        get ':id/transactions', to: 'transactions#index'
        get ':id/invoice_items',to: 'invoice_items#index'
        get ':id/items', to: 'items#index'
        get ':id/customer', to: 'customers#show'
        get ':id/merchant', to: 'merchants#show'
      end
      namespace 'customers' do
        get 'random', to: 'random#show'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get ':id/invoices', to: 'invoices#index'
        get ':id/transactions', to: 'transactions#index'
      end
      namespace 'invoice_items' do
        get 'random', to: 'random#show'
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
        get ':id/invoice', to: 'invoices#show'
        get ':id/item', to: 'items#show'
      end
      resources 'invoices', only: [:index, :show]
      resources 'invoice_items', only: [:index, :show]
      resources 'customers', only: [:index, :show]
      resources 'merchants', only: [:index, :show]
      resources 'transactions', only: [:index, :show]
      resources 'items', only: [:index, :show]
    end
  end
end
