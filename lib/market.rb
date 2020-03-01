module FarMar 
  class Market 
    attr_reader :id, :name, :address, :city, :country, :state, :zip 
    
    def initialize(id, name, address, city, country, state, zip)

      unless (id.instance_of? Integer) && (id > 0)
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end 

      @id = id
      @name = name 
      @address = address 
      @city = city 
      @country = country 
      @state = state 
      @zip = zip
    end 
  end 
end 