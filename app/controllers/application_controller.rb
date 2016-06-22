class ApplicationController < Sinatra::Base

  configure do 
    enable :sessions
    set :session_secret, "oils"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Welcome to Oils of Joy"
  end

end