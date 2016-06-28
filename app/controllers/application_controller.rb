class ApplicationController < Sinatra::Base

  configure do 
    enable :sessions
    set :session_secret, "oils"
    set :views, 'app/views'
  end

  get '/' do 
    erb :index
  end

  helpers do 

    def logged_in?
      !!session[:user_id]
    end

    def logout
      session.clear
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end