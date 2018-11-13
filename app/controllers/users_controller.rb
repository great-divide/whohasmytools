class UsersController < ApplicationController
  

  post "/login" do
    @user = User.find_by(username: params["login"]["username"])

    if @user && @user.authenticate(params["login"]["password"])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect '/'
    end
  end


  post "/logout" do
    if logged_in?
      session.clear
      redirect '/'
    else
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect '/'
    end
  end


  # get "/users" do
  #   erb :"/users/index"
  # end

  
  post "/signup" do
    if !logged_in?
      if params["username"] != "" && params["email"] != "" && params["password"] != "" && !User.find_by(username: params["username"])
        
        @user = User.create(params)
        session[:user_id] = @user.id
      
        redirect "/users/#{@user.id}"
      else
        flash[:signup_error] = "Something wasn't right, please try again."
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
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect "/"
    end
  end

  
  get "/users/:id/edit" do
    if logged_in?
      @user = current_user
      erb :"/users/edit"
    else
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect '/'
    end
  end

  
  patch "/users/:id" do
    redirect "/users/:id"
  end

  
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
