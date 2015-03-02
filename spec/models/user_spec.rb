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

  it "should  not validate name lenght > 50" do

    user.name = "pr"*50
    user.valid?
    expect(user.errors[:name].size).to be 1
    expect(user).to be_invalid
  end

  it "should validate name lenght < 50" do
    user.name = "Praveen"
    user.valid?
    expect(user.errors[:name].size).to be 0
    expect(user).to be_valid

  end

  it "should not validate password lenght < 6" do

    user.password = "prave"
    user.valid?
    expect(user.errors[:password].size).to be 1
    expect(user).to be_invalid
  end

  it "should validate password lenght > 5" do

    user.password = "Password@1"
    user.valid?
    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid
  end

  it "should validate name praveen" do
    
    
    user.name = "Praveen"
    value = user.valid?
    expect(value).to be_truthy
  end

  it "should not validate an empty name"do
  
  user.name = ""
  value = user.valid?
  expect(value).to be_falsy
end

it "should validate email pmenon@qwinixtech.com" do
  
  user.email = "pmenon@qwinixtech.com"
  value = user.valid?
  expect(value).to be_truthy
end

it "should not validate email praveenmenon.com"do
user.email = "praveenmenon.com"
value = user.valid?
expect(value).to be_falsy
end

it "should validate password Password@1" do
  
  user.password = "Password@1"
  value = user.valid?
  expect(value).to be_truthy
end

end
