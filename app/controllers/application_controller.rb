require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if !logged_in?
      erb :index
    else
      redirect "/users/#{current_user.id}"
    end
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
        redirect '/'
      end
    end
  end
  
end
