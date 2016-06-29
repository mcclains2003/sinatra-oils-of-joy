require 'sinatra/flash'

class VariantsController < ApplicationController
  register Sinatra::Flash

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
    if admin?
      erb :"/variants/variant_new"
    else
      flash[:message] = "You do not have access to this page"
    end
  end

  get '/variants/:id' do 
    @variant = Variant.find_by_id(params[:id])
    erb :"/variants/variant_show"
  end

  post '/variants' do
    @variant = Variant.create(params)

    redirect '/variants'
  end

  get '/variants/:id/edit' do 
    if admin?
      @variant = Variant.find_by_id(params[:id])
      erb :"/variants/variant_edit"
    else
      flash[:message] = "You do not have access to this page"

      redirect '/variants'
    end
  end

  post '/variants/:id' do 
    @variant = Variant.find_by_id(params[:id])
    @variant.size = params["size"]
    @variant.cost = params["cost"]
    @variant.save

    redirect "/variants"
  end

  delete '/variants/:id/delete' do 
    @variant = Variant.find_by_id(params[:id])
    if admin?
      @variant.delete
      redirect '/variants'
    else
      flash[:message] = "You do not have access to delete this"
      redirect '/variants'
    end
  end

end