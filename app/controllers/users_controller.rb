require 'sinatra/flash'

class UsersController < ApplicationController
  register Sinatra::Flash

  get '/signup' do
    if !session[:user_id]
      erb :'/users/create_user'
    else
      redirect to '/products'
    end
  end

  post '/signup' do 
    binding.pry
    if params[:username] == "" || params[:password] == ""
      flash[:message] = "Please check to make sure you have a username or password"
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/products'
    end
  end

  get '/login' do 
    if !session[:user_id]
      erb :'/users/login'
    else
      redirect '/products'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/products"
    else
      flash[:message] = "Incorrect username or password"
      redirect to '/login'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy

      redirect to '/login'
    else
      redirect to '/'
    end
  end

end