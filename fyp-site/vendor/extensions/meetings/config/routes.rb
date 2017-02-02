Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :meetings do
    resources :meetings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :meetings, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :meetings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
