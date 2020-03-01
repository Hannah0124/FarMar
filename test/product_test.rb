require_relative 'spec_helper'

describe "Market" do 
  describe "#initialize" do
    it "Creates an instance of market" do 
      product = FarMar::Product.new(1, "Dry Beets", 1)

      expect(product).must_be_kind_of FarMar::Product
    end 

    it "Keeps track of ID" do 
      id = 1337
      product = FarMar::Product.new(id, "Dry Beets", 1)
      expect(product).must_respond_to :id 
      expect(product.id).must_equal id
    end 

    it "Requires a integer ID" do 
      expect {
        product = FarMar::Product.new("Not an integer", "Dry Beets", 1)
      }.must_raise ArgumentError
    end 

    it "Requires a positive ID" do 
      expect {
        product = FarMar::Product.new(-10, "Dry Beets", 1)
      }.must_raise ArgumentError
    end 

    it "Keeps track of name" do 
      name = "test"
      product = FarMar::Product.new(1, name, 1)

      expect(product).must_respond_to :name
      expect(product.name).must_equal name
    end 

    it "Keeps track of vendor_id" do 
      vendor_id = 10
      product = FarMar::Product.new(1, "Dry Beets", vendor_id)

      expect(product).must_respond_to :vendor_id
      expect(product.vendor_id).must_equal vendor_id
    end 
  end 
end 