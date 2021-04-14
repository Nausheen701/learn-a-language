Rails.application.routes.draw do
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# where our routes live
# define a rouote, map to a controller action
# ReStful routes
resources :students # this gives us the 7 restful routes, do not need to write them out
resources :instructors
resources :courses
resources :program

# # show all users
# get '/students', to: 'students#index' #static

# # show details of 1 user
# get '/students/:id', to: 'students#show' #dynamic

# # show new user form
# get '/students/new', to: 'students#new' #static

# # process the new user form submitted
# post '/students', to: 'students#create'

# # show edit user form
# get '/students/:id/edit', to: 'students#edit' #static

# # process the edit user form submitted
# patch '/students/:id/', to: 'students#update'

# # delete a user object
# delete '/students/:id', to: 'students#destroy'



# # get 'most_user', to: 'students#most_other_languages', as: 'polyglot_student'

# # show all courses
# get '/courses', to: 'courses#index' #static

# # show details of 1 course
# get '/courses/:id', to: 'courses#show' #dynamic

# # show new course form
# get '/courses/new', to: 'courses#new' #static

# # process the new course form submitted
# post '/courses', to: 'courses#create'

# # show edit course form
# get '/courses/:id/edit', to: 'courses#edit' #static

# # process the edit course form submitted
# patch '/courses/:id/', to: 'courses#update'

# # delete a course object
# delete '/courses/:id', to: 'scourses#destroy'


# # show all instructors
# get '/instructors', to: 'instructors#index' #static

# # show details of 1 course
# get '/instructors/:id', to: 'instructors#show' #dynamic

# # show new course form
# get '/instructors/new', to: 'instructors#new' #static

# # process the new course form submitted
# post '/instructors', to: 'instructors#create'

# # show edit course form
# get '/instructors/:id/edit', to: 'instructors#edit' #static

# # process the edit course form submitted
# patch '/instructors/:id/', to: 'instructors#update'

# # delete a course object
# delete '/instructors/:id', to: 'instructors#destroy'

end

