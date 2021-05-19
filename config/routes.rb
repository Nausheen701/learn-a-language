Rails.application.routes.draw do
 
  root to: 'pages#home'
  get '/signup', to: 'instructors#new'
  post '/signup', to: 'instructors#create'
  get '/login', to: 'sessions#instructor_login_new'
  post '/login', to: 'sessions#instructor_login_create'
  post '/logout', to: 'sessions#logout'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# where our routes are declared
# define a route, map to a controller action
# ReStful routes

#nested routes should go in one direction
#parent to child

#only nested routes we want are index, new, create

resources :instructors do  # this gives us the 7 restful routes, do not need to write them out
  resources :courses
  # resources :courses, only: [:index, :new, :show, :create] #7 restful routes for nested resoureces
end

# resources :courses, only [:index, :new, :create] # anything non-nested
# # only nested routes we want are index, new, create
# resources :students do  # this gives us the 7 restful routes, do not need to write them out
#   resources :courses, shallow: true #7 restful routes for nested resoureces
# end

resources :instructors
resources :students
resources :courses  # anything non-nested
resources :program

end

