class UsersController < ApplicationController
  
  get "/users" do
    erb :"/users/index"
  end


  get "/users/new" do
    erb :"/users/new"
  end

  
  post "/signup" do
    if !logged_in?
      if params["username"] != "" && params["email"] != "" && params["password"] != ""
        @user = User.create(params)
        session[:user_id] = @user.id

        redirect "/users/#{@user.id}"
      else
        redirect "/users/signup"
      end
    else
      @user = current_user
      redirect "/users/#{@user.id}"
    end
  end

  get "/users/:id" do
    if logged_in?
      @user = User.find(params["id"])
      erb :"/users/show"
    else 
      redirect "/login"
    end
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
