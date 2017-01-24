Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources 'merchants', only: [:index, :show]
      namespace 'items' do
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
      end
      resources 'items', only: [:index, :show]
    end
  end
end
