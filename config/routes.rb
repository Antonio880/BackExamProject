Rails.application.routes.draw do
  post "register" => "sessions#register"
  post "login" => "sessions#login"

  resources :users do
    collection do
      post 'login'
    end
  end

  resources :rooms do
    member do
      post 'users/:user_id', to: 'rooms#add_user'
      get 'students', to: 'rooms#get_students'
    end
    collection do
      get 'created_by/:created_by_id', to: 'rooms#created_by'
    end
  end

  resources :exams, only: [:create, :destroy] do
    member do
      post 'generate-questions'
      post 'submit'
    end
    collection do
      get 'created_by/:created_by_id', action: :created_by
      get 'room_exams/:room_id', action: :room_exams
    end
  end

  get '/current_user', to: 'users#current'
end
