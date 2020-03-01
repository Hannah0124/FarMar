module FarMar 
  class Vendor
    attr_reader :id, :name, :employee_count, :market_id

    def initialize(id, name, employee_count, market_id)

      unless (id.instance_of? Integer) && (id > 0)
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end 

      unless (market_id.instance_of? Integer) && (market_id > 0)
        raise ArgumentError.new("Market ID must be a positive integer (got #{market_id})")
      end 

      @id = id
      @name = name 
      @employee_count = employee_count
      @market_id = market_id
    end
    
    def self.all 
      CSV.readlines("support/vendors.csv").map do |line|
        Vendor.new(line[0].to_i, line[1], line[1], line[3].to_i)    
      end 
    end 
  
    def self.find(id)
      all.select { |vendor| vendor.id == id }.first
    end 
  end 
end 