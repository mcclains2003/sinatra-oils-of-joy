class ApplicationController < Sinatra::Base

  configure do 
    enable :sessions
    set :session_secret, "oils"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Oils of Joy"
  end

  helpers do 

    def logged_in?
      "logged in"
    end

    def logout
      session.clear
    end

    def current_user
      "find current user"
    end

  end

end