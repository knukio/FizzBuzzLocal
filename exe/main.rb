require "FizzBuzzLocal"
include FizzBuzzLocal

MIN = (ARGV[0] || "1").to_i    # default = 1
MAX = (ARGV[1] || "100").to_i  # default = 100

CONVERSION_TABLE = {
  3 => "Fizz",
  5 => "Buzz"
}

numbers = Array(MIN..MAX)
puts convert_numbers(numbers, CONVERSION_TABLE).join(' ')


