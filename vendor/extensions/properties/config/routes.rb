Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :properties do
    resources :properties, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :properties, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :properties, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :properties do
    resources :area_codes, :only => [:index, :show]
  end

  # Admin routes
  namespace :properties, :path => '' do
    namespace :admin, :path => 'refinery/properties' do
      resources :area_codes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :properties do
    resources :cities, :only => [:index, :show]
  end

  # Admin routes
  namespace :properties, :path => '' do
    namespace :admin, :path => 'refinery/properties' do
      resources :cities, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
