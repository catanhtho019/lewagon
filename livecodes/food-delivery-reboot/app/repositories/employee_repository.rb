require_relative '../models/employee'
require 'csv'
class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv
  end

  def all
    @employees
  end

  def add(employee)
    employee.id = @next_id
    @employees << employee
    @next_id += 1
    save_csv
  end

  def find_by_username(username)
    @employees.find {|employee| employee.username == username }
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w(id username password role)
      @employees.each do |employee|
        csv << [ employee.id, employee.username, employee.password, employee.role ]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.last.id + 1 unless @employees.empty?
  end
end