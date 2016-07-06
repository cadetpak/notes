Rails.application.routes.draw do

root 'users#index'

#USERS
post '/register' => 'users#create'
get '/dashboard' => 'users#dashboard'
delete '/users' => 'users#logout'
post '/login' => 'users#login'

#NOTES
post '/create' => 'notes#create'
delete '/:id' => 'notes#destroy'


end
