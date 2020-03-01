require_relative 'spec_helper'

describe "Vendor" do 
  describe "#initialize" do
    it "Creates an instance of Vendor" do 
      vendor = FarMar::Vendor.new(1, "Feil-Farrell", 8, 1)

      expect(vendor).must_be_kind_of FarMar::Vendor
    end 

    it "Keeps track of ID" do 
      id = 1337
      vendor = FarMar::Vendor.new(id, "Feil-Farrell", 8, 1)

      expect(vendor).must_respond_to :id 
      expect(vendor.id).must_equal id
    end 

    it "Requires a integer ID" do 
      expect {
        vendor = FarMar::Vendor.new("Not an integer", "Feil-Farrell", 8, 1)
      }.must_raise ArgumentError
    end 

    it "Requires a positive ID" do 
      expect {
        vendor = FarMar::Vendor.new(-10, "Feil-Farrell", 8, 1)
      }.must_raise ArgumentError
    end 

    it "Keeps track of name" do 
      name = "test"
      vendor = FarMar::Vendor.new(1, name, 8, 1)

      expect(vendor).must_respond_to :name
      expect(vendor.name).must_equal name
    end 

    it "Keeps track of employee_count" do 
      employee_count = 8 
      vendor = FarMar::Vendor.new(1, "Feil-Farrell", employee_count, 1)

      expect(vendor).must_respond_to :employee_count
      expect(vendor. employee_count).must_equal  employee_count

    end 

    it "Keeps track of market_id" do 
      market_id = 10
      vendor = FarMar::Vendor.new(1, "Feil-Farrell", 8, market_id)

      expect(vendor).must_respond_to :market_id
      expect(vendor.market_id).must_equal market_id
    end 

    it "Requires a integer market ID" do 
      expect {
        vendor = FarMar::Vendor.new(1, "Feil-Farrell", 8, "Not an integer")
      }.must_raise ArgumentError
    end 

    it "Requires a positive market ID" do 
      expect {
        vendor = FarMar::Vendor.new(1, "Feil-Farrell", 8, -10)
      }.must_raise ArgumentError
    end 
  end 
end 
