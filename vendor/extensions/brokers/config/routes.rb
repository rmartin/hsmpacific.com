Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :brokers do
    resources :brokers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :brokers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :brokers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
