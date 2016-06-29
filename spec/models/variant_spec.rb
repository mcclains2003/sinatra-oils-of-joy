require 'spec_helper'
require 'pry'

describe Variant do 
  it "is valid with a size and cost" do 
    variant = Variant.new(
      size: '8 oz cream',
      cost: 6)
    expect(variant).to be_valid
  end

  it "is invalid without a cost" do 
    variant = Variant.new(size: "8 oz cream")

    variant.valid?

    expect(variant.errors[:cost]).to include("can't be blank")
  end

  it "is invalid without a size" do 
    variant = Variant.new(cost: 6)

    variant.valid?

    expect(variant.errors[:size]).to include("can't be blank")
  end    
  
end