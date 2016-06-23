class ProductsController < ApplicationController

  get '/products' do 
    @products = Product.all

    erb :"/products/product_index"
  end

  get '/products/new' do 
    @product_types = Product.types
    erb :"/products/product_new"
  end

  get '/products/:id' do 
    @product = Product.find_by_id(params[:id])
    erb :"/products/product_show"
  end

  post '/products' do
    @product = Product.create(params)
  end

  get '/products/:id/edit' do 
    @product = Product.find_by_id(params[:id])
    erb :"/products/product_edit"    
  end

  post '/products/:id' do 
    @product = Product.find_by_id(params[:id])
    @product.name = params["name"]
    @product.product_type = params["product_type"]
    @product.save

    redirect "/products/#{@product.id}"
  end

end