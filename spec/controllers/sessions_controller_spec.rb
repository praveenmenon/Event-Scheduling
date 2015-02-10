require 'rails_helper'
require 'spec_helper'
RSpec.describe SessionsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}

  it " user should be able to create session" do
    
    session[:user_id]=nil
    post :create, {:email =>user.email, :password =>user.password}
    expect(session[:user_id]).not_to eq nil
  end

  it "should destroy the session" do
   
   session[:user_id]= user.id
   delete :destroy
   expect(session[:user_id]).to eq nil

 end

end