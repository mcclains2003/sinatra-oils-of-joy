class Oil < ActiveRecord::Base
  has_many :products, :through => :product_oils
  has_many :product_oils
end