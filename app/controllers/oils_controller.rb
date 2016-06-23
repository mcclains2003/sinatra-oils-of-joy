class OilsController < ApplicationController

  get '/oils' do 
    @oils = Oil.all

    erb :"/oils/oil_index"
  end

  get '/oils/new' do 
    erb :"/oils/oil_new"
  end

  # get '/oils/:id' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   erb :"/oils/oil_show"
  # end

  post '/oils' do
    binding.pry
    @oil = Oil.create(params)
  end

  # get '/oils/:id/edit' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   erb :"/oils/oil_edit"    
  # end

  # post '/oils/:id' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   @oil.name = params["name"]
  #   @oil.oil_type = params["oil_type"]
  #   @oil.save

  #   redirect "/oils/#{@oil.id}"
  # end

  # delete '/oils/:id/delete' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   @oil.delete

  #   redirect '/oils'
  # end

end