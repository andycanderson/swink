Practice::Application.routes.draw do
  root to: 'home#index' 

  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'

  get '/recruiter' => 'recruiters#index'
  get '/applicant' => 'applicants#index'
  
  delete '/signout' => 'sessions#destroy', as: :sign_out
end
