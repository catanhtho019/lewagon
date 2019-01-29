class Patient
  attr_accessor :room, :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type]
  end

  def cure
    @cured = true
  end
end
