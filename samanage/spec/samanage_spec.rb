require 'spec_helper'

RSpec.describe Samanage do

  before do
  	@ticket = {"incident" => 
  		{"name" => "Testing Samanage Gem",
         "category" => {"name" => "Optional"},
         "priority" => "None",
         "requester" => {"email" => "bbogus@bogus.com"},
         "assignee" => {"email" => "bbogus@westmont.edu"},
         "description" => "Samanage Gem Test"
        }
    }
  end

  it "has a version number" do
    expect(Samanage::VERSION).not_to be nil
  end

  it "Creates a Samanage Support Ticket" do
   	VCR.use_cassette("new_incident") do
   		expect(Samanage.createIncident(@ticket)).to be true
   	end
  end
end
