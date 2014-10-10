Practice::Application.routes.draw do
  root to: 'home#index' 

  get 'home/new' => 'home#new', as: :sign_up
  get 'home/about' => 'home#about', as: :about
  get 'home/contact' => 'home#contact', as: :contact

  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/signout' => 'sessions#destroy', as: :sign_out


  get '/recruiter' => 'recruiters#index'
  get '/newposting' => 'postings#new'
  post '/newposting' => 'postings#create', as: :new_post


  get '/applicant' => 'applicants#index', as: :applicant_home
  get '/myprofile' => 'profile#showmine', as: :my_profile
  patch '/myprofile' => 'profile#update'

  
  get '/like/:id' => 'likes#likesave', as: :like
  get '/dislike/:id' => 'likes#dislikesave', as: :dislike


  post '/searchprofile' => 'profile#search'
  get '/profile/:id' => 'profile#seeprofile', as: :seeprofile

  get '/notification/:id' => 'likes#removenotification', as: :removenotification

  scope 'api', defaults: {format: "json"} do
    get '/' => 'apis#index'
  end
end
