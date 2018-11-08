class UsersController < ApplicationController

  
  get "/users" do
    erb :"/users/index"
  end


  get "/users/new" do
    erb :"/users/new"
  end

  
  post "/users" do
    redirect "/users"
  end

  get "/users/:id" do
    erb :"/users/show"
  end

  
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  
  patch "/users/:id" do
    redirect "/users/:id"
  end

  
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
