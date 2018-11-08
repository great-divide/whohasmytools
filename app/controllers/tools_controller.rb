class ToolsController < ApplicationController

  # GET: /too_ls
  get "/too_ls" do
    erb :"/too_ls/index.html"
  end

  # GET: /too_ls/new
  get "/too_ls/new" do
    erb :"/too_ls/new.html"
  end

  # POST: /too_ls
  post "/too_ls" do
    redirect "/too_ls"
  end

  # GET: /too_ls/5
  get "/too_ls/:id" do
    erb :"/too_ls/show.html"
  end

  # GET: /too_ls/5/edit
  get "/too_ls/:id/edit" do
    erb :"/too_ls/edit.html"
  end

  # PATCH: /too_ls/5
  patch "/too_ls/:id" do
    redirect "/too_ls/:id"
  end

  # DELETE: /too_ls/5/delete
  delete "/too_ls/:id/delete" do
    redirect "/too_ls"
  end
end
