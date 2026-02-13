Rails.application.routes.draw do
  resources :bugs, only: :index do
    collection do
    end
  end

  resources :components, only: %i[index new create] do
    collection do
      get :menu
      get :overflow
    end
  end
  get "/component", to: "components#show", as: :component

  resources :configurations, only: [] do
    get "ios_v1", on: :collection
    get "android_v1", on: :collection
  end

  resource :dashboards, only: :show

  resource :modal, only: %i[new show] do
    collection do
      get :replace
    end
  end

  resource :navigation, only: :show do
    collection do
      get :redirect
      get :redirected
      get :replace
      get :slow
      get :second
    end
  end

  resources :numbers, only: %i[index show]

  resources :resources, only: %i[index new create] do
    collection do
      get :http_codes
      get :long
      get :scroll
      get :upload
    end
  end
  get "/resource", to: "resources#show", as: :resource

  resource :session, only: %i[new create destroy]
  get "/protected", to: "sessions#protected"

  direct(:docs) { "https://native.hotwired.dev" }
  direct(:book) { "https://pragprog.com/titles/jmnative/hotwire-native-for-rails-developers/" }
  direct(:bridge_components) { "https://native.hotwired.dev/overview/bridge-components" }

  get :external_redirect, to: redirect("https://37signals.com")

  # Defines the root path route ("/")
  root "dashboards#show"
end
