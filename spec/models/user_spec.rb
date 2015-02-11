require 'rails_helper'

RSpec.describe User,:type => :model do
  
  let(:user){FactoryGirl.create(:user)}

  context "Factory settings for users" do
    it "should validate the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
    end
    
    describe User do
      it{should validate_presence_of :name}
      it { should allow_value('Praveen').for(:name )}
      it{should validate_presence_of :email}
      it { should allow_value('pmenon@qwinixtech.com').for(:email )}
      it { should validate_presence_of :password }
      it { should allow_value('Password@1').for(:password )}
    end
  end

  it "should validate name lenght" do

    user.name = "pr"*50
    user.valid?
    expect(user.errors[:name].size).to be 1
    expect(user).to be_invalid

    user.name = "Praveen"
    user.valid?
    expect(user.errors[:name].size).to be 0
    expect(user).to be_valid

  end
  it "should validate password lenght" do

    user.password = "prave"
    user.valid?
    expect(user.errors[:password].size).to be 1
    expect(user).to be_invalid

    user.password = "Password@1"
    user.valid?
    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid
  end

  it "should validate name" do
    
    ["Praveen", "Menon"].each do |n|
      user.name = n
      value = user.valid?
      expect(value).to be_truthy
    end

    
    [""].each do |n|
      user.name = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

  it "should validate email" do
    
    ["pmenon@qwinixtech.com", "praveenmenon@gmail.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_truthy
    end

    # checking invalid email
    ["praveen.007.gmail.com", "praveenmenon.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

  it "should validate password" do
    
    ["Password@1", "Password@1"].each do |n|
      user.password = n
      value = user.valid?
      expect(value).to be_truthy
    end
    
  end

end
