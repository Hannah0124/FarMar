module FarMar 
  class Vendor < Loadable
    attr_reader :name, :employee_count, :market_id

    def initialize(id, name, employee_count, market_id)
      super(id)

      unless (market_id.instance_of? Integer) && (market_id > 0)
        raise ArgumentError.new("Market ID must be a positive integer (got #{market_id})")
      end 

      @name = name 
      @employee_count = employee_count
      @market_id = market_id
    end

    def products
      Product.find_by_vendor(@id) 
    end 

    def self.csv_filename 
      "support/vendors.csv"
    end 

    def self.from_csv_line(line)
      self.new(line[0].to_i, line[1], line[1], line[3].to_i) 
    end 
  end 
end 