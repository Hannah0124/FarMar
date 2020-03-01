require_relative 'spec_helper'

describe "Market" do 
  describe "#initialize" do
    it "Creates an instance of market" do 
      market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland","Multnomah", "Oregon", "97202"
      )

      expect(market).must_be_kind_of FarMar::Market
    end 

    it "Keeps track of ID" do 
      id = 1337
      market = FarMar::Market.new(id, "People's Co-op Farmers Market", "30th and Burnside", "Portland","Multnomah", "Oregon", "97202"
      ) 
      expect(market).must_respond_to :id 
      expect(market.id).must_equal id
    end 

    it "Requires a integer ID" do 
      proc {
        FarMar::Market.new("not an integer", "test", "test", "test", "test", "test", "test")
      }.must_raise ArgumentError
    end 

    it "Requires a positive ID" do 
      proc {
        FarMar::Market.new(-10, "test", "test", "test", "test", "test", "test")
      }.must_raise ArgumentError
    end 

    it "Keeps track of country" do 
      country = "USA"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland",country, "Oregon", "97202"
      ) 
      expect(market).must_respond_to :country
      expect(market.country).must_equal country
    end 

    it "Keeps track of ID" do 
      state = "test"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland","Multnomah", state, "97202"
      ) 
      expect(market).must_respond_to :state
      expect(market.state).must_equal state
    end 

    it "Keeps track of ID" do 
      zip = "98107"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland","Multnomah", "Oregon", zip
      ) 
      expect(market).must_respond_to :zip 
      expect(market.zip).must_equal zip
    end 
  end 
end 