module FarMar 
  class Loadable
    attr_reader :id 

    def initialize(id)
      unless (id.instance_of? Integer) && (id > 0)
        raise ArgumentError.new("ID must be a positive integer (got #{id})")
      end 

      @id = id 
    end

    # Create a new instance
    def self.from_csv_line(line) 
      raise NotImplementedError.new("Implement this in the sub class")
    end 

    # Get a CSV file name
    def self.csv_filename 
      raise NotImplementedError.new("Implement this in the sub class")
    end 

    def self.all 
      CSV.readlines(csv_filename).map do |line|
        from_csv_line(line)
      end 
    end 

    def self.find(id) 
      all.select { |entry| entry.id == id }.first
    end 
  end 
end 