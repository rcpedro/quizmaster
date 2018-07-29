Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :courses,   only: [:index, :show]
      resources :topics,    only: [:index, :show]
      resources :subtopics, only: [:index, :show]
    end
  end
end
