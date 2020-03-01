module FarMar 
  class Product < Loadable
    attr_reader :name, :vendor_id

    def initialize(id, name, vendor_id)
      super(id)

      unless (vendor_id.instance_of? Integer) && (vendor_id > 0)
        raise ArgumentError.new("Vendor ID must be a positive integer (got #{vendor_id})")
      end 

      @name = name 
      @vendor_id = vendor_id
    end 


    def vendor 
      Vendor.find(@vendor_id)
    end 

  
    def self.csv_filename 
      "support/products.csv"
    end 

    def self.from_csv_line(line)
      self.new(line[0].to_i, line[1], line[2].to_i)
    end 

    def self.find_by_vendor(vendor_id)
      all.select { |product| product.vendor_id == vendor_id}
    end 
  end
end 