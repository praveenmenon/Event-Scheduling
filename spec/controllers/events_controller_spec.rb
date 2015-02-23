require 'rails_helper'
require 'spec_helper'

RSpec.describe EventsController, :type => :controller do

let(:user) {FactoryGirl.create(:user)}
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}
  let(:user3) {FactoryGirl.create(:user)} 
  let(:user4) {FactoryGirl.create(:user)}  

  let(:invitee) {FactoryGirl.create(:invitee)}  
  let(:event) {FactoryGirl.create(:event)}


  describe "POST create" do
    it "user should be able to create an event" do
      event_params = {
        event: {
          event_name: "Praveen's Birthday",
					venue: "By The Way",
					date: "2015-08-10",
					time: "2000-01-01 19:00:00",
					description: "welcome friends",
					status: "Open",
          user_id: user.id
        }
      }

      expect do
        session[:user_id]= user.id
        binding.pry
        post :create, event_params
      end.to change(Event, :count).by(1)
    end
  end

end