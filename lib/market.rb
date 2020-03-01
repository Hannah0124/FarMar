require_relative 'loadable'

module FarMar 
  class Market < Loadable
    attr_reader :name, :address, :city, :country, :state, :zip 
    
    def initialize(id, name, address, city, country, state, zip)
      super (id)
      @name = name 
      @address = address 
      @city = city 
      @country = country 
      @state = state 
      @zip = zip
    end 

    def self.from_csv_line(line)
      self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
    end 

    def self.csv_filename 
      "support/markets.csv"
    end 
  end 
end 