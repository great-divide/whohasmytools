class ToolsController < ApplicationController

 
  # if User as more than, say 10 tools... show 10 on user/show, add link for this to list them all
  # get "/tools" do

  # end

  
  # get "/tools/new" do
    # if logged_in?
      
    # else
    #   redirect "/users/login"
    # end

  #   erb :"/tools/new"
  # end


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

  get '/users/tools' do
    if logged_in?
      @user = current_user

      erb :"/tools/user_tools"
    else 
      redirect '/'
    end
  end

  get "/tools/:id" do
    if logged_in?
      @tool = Tool.find_by(id: params["id"])
      # binding.pry

      erb :"/tools/show"
    else 
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect "/"
    end

    
  end

 
  get "/tools/:id/edit" do
    @tool = Tool.find_by(id: params["id"])

    if logged_in?
      if @tool.user_id == current_user.id

         erb :"/tools/edit"
      end
    else
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect "/"
    end

   
  end


  patch "/tools/:id" do
    @tool = Tool.find_by(id: params["id"])

    if logged_in?
      if @tool.user_id == current_user.id
          @tool.name = params["tool"]["name"]
          @tool.description = params["tool"]["description"]
          @tool.save

         redirect "/tools/#{@tool.id}"
      end
    else
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect "/"
    end
  end

 
  delete "/tools/:id/delete" do
    if logged_in? && current_user.tools.include?(Tool.find_by(params["id"]))
        @tool = Tool.find_by(params["id"])
        @tool.delete
        
        redirect "/users/tools"
    else 
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect '/'
    end
  end
end
