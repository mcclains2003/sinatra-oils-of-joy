class ProductsController < ApplicationController

  get '/products' do 
    @products = Product.all

    erb :"/products/product_index"
  end

  get '/products/new' do 
    @product_types = Product.types
    erb :"/products/product_new"
  end

  post '/products' do
    binding.pry
    @product = Product.create(params)
  end

end