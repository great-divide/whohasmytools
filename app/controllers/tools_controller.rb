class ToolsController < ApplicationController


  post "/tools/new" do
  
    if logged_in?
      if params["tool"]["name"] == ""
        flash[:tool_error] = "You forgot to name that tool!"

        redirect "/users/#{current_user.id}"
      else
        @user = current_user
        @tool = Tool.create(params["tool"])
        @user.tools << @tool
        # do i have to run 'save' here?
        @user.save

        redirect "users/#{@user.id}"
      end
    else
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect "/users/login"
    end
  end

  get '/users/tools' do
    redirect_if_not_logged_in
    @user = current_user

    erb :"/tools/user_tools"
  end

  get "/tools/:id" do
    redirect_if_not_logged_in
    @tool = Tool.find_by(id: params["id"])

    erb :"/tools/show"
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
    if logged_in? && current_user.tools.include?(Tool.find_by(id: params["id"]))
        # binding.pry
        @tool = Tool.find_by(id: params["id"])
        @tool.delete
        
        redirect "/users/tools"
    else 
      flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
      redirect '/'
    end
  end
end
