class ProductsController < ApplicationController

  get '/products' do 
    @creams = Product.all.select{|product| product.product_type == "cream"}
    @oils = Product.all.select{|product| product.product_type == "oil"}
    @scrubs = Product.all.select{|product| product.product_type == "scrub"}
    @lips = Product.all.select{|product| product.product_type == "lip-balm"}
    @sprays = Product.all.select{|product| product.product_type == "spray"}

    erb :"/products/product_index"
  end

  get '/products/new' do 
    @product_types = Product.types
    erb :"/products/product_new"
  end

  get '/products/:id' do 
    @product = Product.find_by_id(params[:id])
    @oils = @product.oils
    @variants = @product.variants
    
    erb :"/products/product_show"
  end

  post '/products' do
    @product = Product.create(params["product"])

    redirect "/products/#{@product.id}"
  end

  get '/products/:id/edit' do 
    @product = Product.find_by_id(params[:id])
    erb :"/products/product_edit"    
  end

  post '/products/:id' do 
    @product = Product.find_by_id(params[:id])
    @product.name = params["product"]["name"]
    @product.product_type = params["product"]["product_type"]
    @product.oil_ids = params["product"]["oil_ids"]
    @product.variant_ids = params["product"]["variant_ids"]
    @product.save

    redirect "/products/#{@product.id}"
  end

  delete '/products/:id/delete' do 
    @product = Product.find_by_id(params[:id])
    @product.delete

    redirect '/products'
  end

end