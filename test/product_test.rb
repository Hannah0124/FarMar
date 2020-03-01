require_relative 'spec_helper'

describe "Product" do 
  describe "#initialize" do
    it "Creates an instance of Product" do 
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
        FarMar::Product.new("Not an integer", "Dry Beets", 1)
      }.must_raise ArgumentError
    end 

    it "Requires a positive ID" do 
      expect {
        FarMar::Product.new(-10, "Dry Beets", 1)
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

    it "Requires a integer vendor_id" do 
      expect {
        FarMar::Product.new(1, "Dry Beets", "Not an integer")
      }.must_raise ArgumentError
    end 

    it "Requires a positive vendor_id" do 
      expect {
        FarMar::Product.new(1, "Dry Beets", -10)
      }.must_raise ArgumentError
    end 
  end 

  describe "#vendor" do
    it "Returns an instance of Vendor with the correct ID" do
      product = FarMar::Product.new(1337, "test product", 10)
      vendor = product.vendor 
      expect(vendor).must_be_kind_of FarMar::Vendor 
      expect(vendor.id).must_equal product.vendor_id
    end 

    it "Returns nil when the vendor_id doesn't correspond to a real vendor" do 
      # Assumption: There is no vendor 9999
      vendor_id = 9999 
      expect(FarMar::Product.find(vendor_id)).must_be_nil "Whoops, didn't expect vendor #{vendor_id} to exist, which invalidates the test"

      product = FarMar::Product.new(1337, "test product", vendor_id)
      vendor = product.vendor
      expect(vendor).must_be_nil
    end 
  end 

  describe "all" do 
    it "Returns an array" do 
      products = FarMar::Product.all 
      expect(products).must_be_kind_of Array
    end 

    it "Returns an array full of Products" do
      products = FarMar::Product.all 
    
      products.each do |product|
       expect(product).must_be_kind_of FarMar::Product
      end 
    end 

    it "Returns an the correct number of Products" do 
      products = FarMar::Product.all
      expect(products.length).must_equal 8193
    end 

    it "Gets the first Product from the file" do 
      products = FarMar::Product.all
      expect(products.first.id).must_equal 1

    end 

    it "Gets the last Product from the file" do 
      products = FarMar::Product.all
      expect(products.last.id).must_equal 8193
    end 
  end 

  describe "find" do 
    it "Returns nil if the product does not exist" do 
      product = FarMar::Product.find(12345)
      expect(product).must_be_nil
    end 

    it "Finds the first product" do 
      id = 1
      product = FarMar::Product.find(id)
      expect(product).must_be_kind_of FarMar::Product
      expect(product.id).must_equal id
    end 

    it "Finds the last product" do 
      id = 500
      product = FarMar::Product.find(id)
      expect(product).must_be_kind_of FarMar::Product
      expect(product.id).must_equal id
    end 
  end 
end 