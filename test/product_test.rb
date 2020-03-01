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