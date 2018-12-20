Rails.application.routes.draw do
 
 #####################   home   #####################
 
  get '/' => "home#top"
  get "/about" => "home#about"
  
 #####################   posts   #####################
  
  get  "posts/index" => "posts#index"
  get  "/posts/new" => "posts#new"
  get  "posts/:id/edit" => "posts#edit"
  get  "/posts/:id"=> "posts#show"
 
  post "/posts/create" => "posts#create"
  post "/posts/:id/update"=> "posts#update"
  post "/posts/:id/destroy"=> "posts#destroy"
  
 #####################   users   #####################
  
  get "/users/index" => "users#index"
  get "users/:id/likes" => "users#likes"
  get "users/:id/edit" => "users#edit"
  get "users/:id" => "users#show"
  
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  
 #####################   users   #####################

  post "likes/:post_id/create" => "likes#create"  
  post "likes/:post_id/destroy" => "likes#destroy"
  
  get "signup"=> "users#new"                   ##ユーザー登録ページ
  
  get  "login"=> "users#login_form"
  post "login" => "users#login"
  
  post "logout" => "users#logout"
  
  
  
  
   
   
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
