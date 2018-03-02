require "FizzBuzzLocal"
include FizzBuzzLocal

def s_to_i(s)
  if s =~ /^-?[1-9][0-9]*$/
    s.to_i
  else
    raise "argument '#{s}' should be integer"
  end
end

DEFAULT_MIN = 1
DEFAULT_MAX = 100

# validate arguments
if !ARGV.size.between?(0, 2)
  raise "the number of arguments should be between 0 and 2"
end

# if there is no argument, the latter value is evaluated
min = s_to_i(ARGV[0] || DEFAULT_MIN)
max = s_to_i(ARGV[1] || DEFAULT_MAX)

if min < DEFAULT_MIN
  raise "first argument should be bigger than #{DEFAULT_MIN}"
end

if max > DEFAULT_MAX
  raise "second argument should be smaller than #{DEFAULT_MAX}"
end

if min > max
  raise "first argument should be smaller than second argument"
end

CONVERSION_TABLE = {
  3 => "Fizz",
  5 => "Buzz"
}

numbers = Array(min..max)
puts convert_numbers(numbers, CONVERSION_TABLE).join(' ')
