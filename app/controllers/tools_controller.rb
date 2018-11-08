class ToolsController < ApplicationController

 
  get "/tools" do
    erb :"/too_ls/index"
  end

  
  get "/too_ls/new" do
    erb :"/tools/new"
  end


  post "/tools" do
    redirect "/tools"
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
