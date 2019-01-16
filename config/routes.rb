Rails.application.routes.draw do
 
 
  resources :hoges
  ActiveAdmin.routes(self)
 #####################   home   #####################
 
  get "/" => "home#top"
  get "/about" => "home#about"
  
 #####################   posts   #####################
   
  get  "posts/index" => "posts#index"
  get  "/posts/new" => "posts#new"
 # get  "posts/:id/edit" => "posts#edit"
  get  "posts/search" => "posts#index"
  #get  "/posts/:id"=> "posts#show"
 
 # post "/posts/create" => "posts#create"
  #post "/posts/:id/update"=> "posts#update"
  post "/posts/:id/destroy"=> "posts#destroy"
 resources :posts
 #####################   users   #####################
 
   get "users/index" => "users#index"
  get "users/:id/likes" => "users#likes"
  #get "users/:id/edit" => "users#edit"
  #get "users/:id" => "users#show"
  
  #patch "users/:id/update" => "users#update"
  post "users/create" => "users#create"
   post "/users/:id/destroy"=> "users#destroy"
   resources :users
   resources :tags
  

 #####################   users   #####################

  post "likes/:post_id/create" => "likes#create"  
  post "likes/:post_id/destroy" => "likes#destroy"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  get "signup"=> "users#new"                   ##ユーザー登録ページ
  get  "login"=> "users#login_form"
 
 ##################### follow    #########################
 
  post  "users/:id/follow" =>   "users#follow"
  post  "users/:id/unfollow" =>   "users#unfollow"

######################### return ########################
resources :returns
post "/returns/:id/destroy"=> "returns#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
