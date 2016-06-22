class Variant < ActiveRecord::Base
  has_many :products, :through => :product_variants
  has_many :product_variants
end