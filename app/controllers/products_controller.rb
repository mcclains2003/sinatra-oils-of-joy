class ProductsController < ApplicationController

  get '/products' do 
    @products = Product.all

    erb :"/products/product_index"
  end

  get 'products/new' do 
  end

end