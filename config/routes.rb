Rails.application.routes.draw do
    resources :users, param: :_username
    post '/auth/login', to: 'authentication#login'
    post '/users', to: 'users#create'
  get '/users/confirm_invitation/:token', to: 'users#confirm_invitation'
    get '/*a', to: 'application#not_found'
end
