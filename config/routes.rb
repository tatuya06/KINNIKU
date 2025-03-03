Rails.application.routes.draw do
  get "/" => "users#login"
  post "users/login_chk" => "users#login_chk"

  get "users/new" => "users#new"
  post "users/createuser" => "users#createuser"

  get "users/:id/show" => "users#show"

  get "users/:id/date" => "users#date"
  post "users/date_reg" => "users#date_reg"

  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"




end
