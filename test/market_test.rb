require_relative 'spec_helper'

describe "Market" do 
  describe "#initialize" do
    it "Creates an instance of Market" do 
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
      expect {
        FarMar::Market.new("not an integer", "test", "test", "test", "test", "test", "test")
      }.must_raise ArgumentError
    end 

    it "Requires a positive ID" do 
      expect {
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

    it "Keeps track of state" do 
      state = "test"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland","Multnomah", state, "97202"
      ) 
      expect(market).must_respond_to :state
      expect(market.state).must_equal state
    end 

    it "Keeps track of zip code" do 
      zip = "98107"
      market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland","Multnomah", "Oregon", zip
      ) 
      expect(market).must_respond_to :zip 
      expect(market.zip).must_equal zip
    end 
  end 


  describe "all" do 
    it "Returns an array" do 
      markets = FarMar::Market.all 
      expect(markets).must_be_kind_of Array
    end 

    it "Returns an array full of Markets" do
      markets = FarMar::Market.all 
    
      markets.each do |market|
       expect(market).must_be_kind_of FarMar::Market
      end 
    end 

    it "Returns an the correct number of Markets" do 
      markets = FarMar::Market.all
      expect(markets.length).must_equal 500
    end 

    it "Gets the first Market from the file" do 
      markets = FarMar::Market.all
      markets.first.id.must_equal 1

    end 

    it "Gets the last Market from the file" do 
      markets = FarMar::Market.all
      markets.last.id.must_equal 500
    end 
  end 

  # describe "find" do 

  # end 

end 