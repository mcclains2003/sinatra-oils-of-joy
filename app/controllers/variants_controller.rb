class VariantsController < ApplicationController

  get '/variants' do 
    @variants = Variant.all
    @creams = Variant.all.select{|variant| variant.size.include?("cream")}
    @oils = Variant.all.select{|variant| variant.size.include?("oil")}
    @scrubs = Variant.all.select{|variant| variant.size.include?("scrub")}
    @lips = Variant.all.select{|variant| variant.size.include?("lip")}
    @sprays = Variant.all.select{|variant| variant.size.include?("spray")}

    erb :"/variants/variant_index"
  end

  get '/variants/new' do 
    erb :"/variants/variant_new"
  end

  # get '/oils/:id' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   erb :"/oils/oil_show"
  # end

  post '/variants' do
    @variant = Variant.create(params)

    redirect '/variants'
  end

  # get '/oils/:id/edit' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   @benefits = @oil.benefits.split(", ")
  #   erb :"/oils/oil_edit"    
  # end

  # post '/oils/:id' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   @oil.name = params["name"]
  #   @oil.benefits = params["benefits"].join(", ")
  #   @oil.save

  #   redirect "/oils/#{@oil.id}"
  # end

  # delete '/oils/:id/delete' do 
  #   @oil = Oil.find_by_id(params[:id])
  #   @oil.delete

  #   redirect '/oils'
  # end

end