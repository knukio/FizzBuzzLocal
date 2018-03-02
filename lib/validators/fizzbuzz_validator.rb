require "utilities/io_util"

# TODO: Validationの置き場所とやり方をそもそも考える
module FizzBuzzValidator
  include IoUtil

  def validate_hash_format(fizzbuzz)
    fizzbuzz.select{ |key, value| key.to_s =~ /[0-9]/ && value.kind_of(String) }.size == fizzbuzz.size
  end

  def validate_length()

  end

  def validate_args()
  end

end