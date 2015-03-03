require 'rails_helper'
require 'spec_helper'

RSpec.describe EventsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
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
          status: "Open"
        }
      }
      session[:user_id]=user.id

      expect do
        post :create, event_params
      end.to change(Event, :count).by(1)
    end
  end

  it "updates the requested event" do
    value = event
    patch :update, {:id => value.id, :event => {:event_name=> "demo", :venue=> "mysore", :date=> "2016-02-28", :time=>"2000-01-01 1:02:00", :description=>"demo in mysore", :status=>"open"}}
    expect(value).should_not eq(event)
  end
end