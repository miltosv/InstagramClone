Rails.application.routes.draw do
  
  get '/' => 'home#index'
  resources :users do
    resources :photos do
      resources :comments

    end
    resources :follows do
      resources :photos do
        resources :comments
      end
    end
    resources :comments
  end
  resources :photos do
    resources :comments do 
      resources :users
    end
  end
  resources :follows, only: [:create, :destroy, :index, :new]
  resources :tags, only: [:create, :destroy]
  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create"
  get '/log-out' => "sessions#destroy", as: :log_out
  delete 'follows/:user_id' => 'follows#destroy'

end
