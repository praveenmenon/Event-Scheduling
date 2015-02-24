require 'rails_helper'
require 'spec_helper'

RSpec.describe Event, :type => :model do
  let(:event){FactoryGirl.create(:event)}

  context "Factory settings for events" do
    it "should validate the event factories" do
      expect(FactoryGirl.build(:event).valid?).to be true
    end
    describe Event do
      it {should validate_presence_of :event_name}
      it { should allow_value("Praveen's Birthday").for(:event_name)}
      it {should validate_presence_of :venue}
      it { should allow_value('By The Way').for(:venue )}
      it { should validate_presence_of :date }
      it { should allow_value('2015-08-19').for(:date )}
      it { should validate_presence_of :description }
      it { should allow_value('welcome friends').for(:description )}
      it { should validate_presence_of :status }
      it { should allow_value('open').for(:status )}
    end
  end
  it "should not validate event name lenght > 30" do
    event.event_name = "pr"*30
    event.valid?
    expect(event.errors[:event_name].size).to be 1
  end
  it "should validate event name lenght < 30" do
    event.event_name = "Praveen"
    event.valid?
    expect(event.errors[:event_name].size).to be 0
  end
  it "should not validate venue lenght > 30" do
    event.venue = "ve"*30
    event.valid?
    expect(event.errors[:venue].size).to be 1
  end
  it "should validate venue lenght < 30" do
    event.venue = "By the Way"
    event.valid?
    expect(event.errors[:venue].size).to be 0
  end  
  it "should validate open, close and blocked as status" do
    ["Open", "Close","Blocked"].each do |n|
      event.status = n
      value = event.valid?
      expect(value).to be_truthy
    end
  end
end
