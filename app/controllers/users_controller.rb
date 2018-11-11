class UsersController < ApplicationController
  

  post "/login" do
    binding.pry
    @user = User.find_by(username: params["login"]["username"])

    if @user && @user.authenticate(params["login"]["password"])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      # redirect signup when signup page is created
      redirect '/'
    end
  end


  post "/logout" do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end
  get "/users" do
    erb :"/users/index"
  end

  
  post "/signup" do
    if !logged_in?
      if params["username"] != "" && params["email"] != "" && params["password"] != "" && !User.find_by(username: params["username"])
        
        @user = User.create(params)
        session[:user_id] = @user.id
      
        redirect "/users/#{@user.id}"
      else
        redirect "/"
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
      redirect "/"
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
