class ToolsController < ApplicationController

 
  get "/tools" do
    erb :"/tools/index"
  end

  
  get "/tools/new" do
    # if logged_in?
      
    # else
    #   redirect "/users/login"
    # end

    erb :"/tools/new"
  end


  post "/tools/new" do
    if logged_in?
      @user = current_user
      @tool = Tool.create(params["tool"])
      @user.tools << @tool
      # do i have to run 'save' here?
      @user.save

      redirect "users/#{@user.id}"
    else
      redirect "/users/login"
    end
  end


  get "/tools/:id" do
    erb :"/tools/show"
  end

 
  get "/tools/:id/edit" do
    erb :"/tools/edit"
  end


  patch "/tools/:id" do
    redirect "/too_ls/:id"
  end

 
  delete "/tools/:id/delete" do
    redirect "/tools"
  end
end
