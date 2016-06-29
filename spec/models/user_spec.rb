require 'spec_helper'
require 'pry'

describe 'User' do 
  before do
    @user = User.create(:username => "testuser", :password => "password")
  end

  it 'is valid with a username and password' do 
    test_user = User.new(username: "test", password: "test")
    expect(test_user).to be_valid
  end

  it 'is invalid without a username' do
    test_user = User.new(password: "test")
    test_user.valid?
    expect(test_user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a password' do 
    test_user = User.new(username: "test")
    test_user.valid?
    expect(test_user.errors[:password]).to include("can't be blank")
  end

  it 'has a secure password' do 
    expect(@user.authenticate("1234")).to eq(false)

    expect(@user.authenticate("password")).to eq(@user)
  end
end