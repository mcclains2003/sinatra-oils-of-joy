require 'sinatra/flash'

class OilsController < ApplicationController
  register Sinatra::Flash

  get '/oils' do 
    @oils = Oil.all

    erb :"/oils/oil_index"
  end

  get '/oils/new' do 
    erb :"/oils/oil_new"
  end

  get '/oils/:id' do 
    @oil = Oil.find_by_id(params[:id])
    erb :"/oils/oil_show"
  end

  post '/oils' do
    if !!params["name"] || !!params["benefits"]
      flash[:message] = "Your oil did not save because one or more required fields were missing"
      redirect '/oils/new'
    else
      @oil = Oil.new
      @oil.name = params["name"]
      @oil.benefits = params["benefits"].join(", ")
      @oil.save

      redirect '/oils'
    end
  end

  get '/oils/:id/edit' do 
    @oil = Oil.find_by_id(params[:id])
    if logged_in?
      @benefits = @oil.benefits.split(", ")
      erb :"/oils/oil_edit"
    else
      redirect "/oils/#{@oil.id}"
    end
  end

  post '/oils/:id' do 
    @oil = Oil.find_by_id(params[:id])
    @oil.name = params["name"]
    @oil.benefits = params["benefits"].join(", ")
    @oil.save

    redirect "/oils/#{@oil.id}"
  end

  delete '/oils/:id/delete' do 
    @oil = Oil.find_by_id(params[:id])
    if logged_in?
      @oil.delete
      redirect '/oils'
    else
      flash[:message] = "You do not have access to delete this item"
      redirect "/oils/#{@oil.id}"
    end
  end

end