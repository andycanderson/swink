Practice::Application.routes.draw do
  root to: 'home#index' 

  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'

  get '/recruiter' => 'recruiters#index'
  get '/newposting' => 'postings#new'
  post '/newposting' => 'postings#create'


  get '/applicant' => 'applicants#index', as: :applicant_home
  get '/myprofile' => 'profile#show', as: :my_profile
  patch '/myprofile' => 'profile#update'

  delete '/signout' => 'sessions#destroy', as: :sign_out


end
