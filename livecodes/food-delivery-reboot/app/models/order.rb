class Order
attr_accessor :id
attr_reader :delivered, :customer, :meal, :employee
  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  # def delivered?
  #   @delivered
  # end
end