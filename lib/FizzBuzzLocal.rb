require "FizzBuzzLocal/version"

module FizzBuzzLocal
  def convert_numbers(numbers, conversion_table)
    numbers.map { |num| convert_number(num, conversion_table) }
  end

  def convert_number(num, conversion_table)
    result = conversion_table.select {|divisor, _| num % divisor == 0}.values.join
    result.empty? ? num : result
  end
end
