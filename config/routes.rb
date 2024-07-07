Rails.application.routes.draw do
  post "register" => "sessions#register"
  post "login" => "sessions#login"

  resources :users do
    member do
      get 'get_room'
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

  resources :exams do
    member do
      post 'generate-questions'
      #get 'questions/:exam_id', to: 'exams#get_questions'
    end
    collection do
      get 'questions/:exam_id', to: 'exams#get_questions'
      get 'created_by/:created_by_id', to: 'exams#created_by'
      get 'room_exams/:room_id', to: 'exams#get_room_exams'
      get ':exam_id/check_user/:user_id', to: 'exams#check_user_exam'
    end
  end

  resources :exam_results do
    collection do
      post 'submit'
    end
  end

  get '/current_user', to: 'users#current'
end
