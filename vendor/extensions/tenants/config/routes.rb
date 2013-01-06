Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :tenants do
    resources :tenants, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :tenants, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :tenants, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
