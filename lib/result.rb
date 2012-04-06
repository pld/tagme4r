class Result
  attr_accessor :spot, :title, :wikipedia_id, :rho

  def initialize(options)
    options.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end
