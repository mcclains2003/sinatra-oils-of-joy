require 'spec_helper'
require 'pry'

describe Oil do 
  it "is valid with a name and benefit" do 
    oil = Oil.new(
      name: 'Wintergreen',
      benefits: "Smells like gum")
    expect(oil).to be_valid
  end

  it "is invalid without a name" do 
    oil = Oil.new(benefits: 'Smells good')
    oil.valid?
    expect(oil.errors[:name]).to include("can't be blank")
  end

  it "is invalid without any benefits" do 
    oil = Oil.new(name: 'Wintergreen')
    oil.valid?
    expect(oil.errors[:benefits]).to include("can't be blank")
  end
end