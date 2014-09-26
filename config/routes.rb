Practice::Application.routes.draw do
  root to: 'home#index' 

  post '/users' => 'users#create'


end
