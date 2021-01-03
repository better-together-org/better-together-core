BetterTogether::Engine.routes.draw do
  scope path: 'bt' do
    get '/' => 'static_pages#home'
  end

  scope path: :bt do
    namespace :api do
      namespace :v1 do
        resources :communities, except: %i[new edit]
        resources :community_memberships, except: %i[new edit]
        resources :people, except: %i[new edit]
        resources :roles, except: %i[new edit]
      end
    end
  end
end
