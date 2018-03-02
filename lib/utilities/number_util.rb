# coding: utf-8

module NumberUtil

  # 数字と約数候補から数字の約数のものだけを取得する
  #
  # @param [Integer] number 割られる数字
  # @param [Array] divide_numbers 割る数字
  # @return [Array] 約数の一覧,またはそのままの数字
  def self.get_divisors(number, divide_numbers)
    divisors = divide_numbers.select { |divide_number| number % divide_number == 0 }
    divisors.empty? ? [number] : divisors
  end

  # 入力が整数かどうかの真偽値を返す
  #
  # @param [Object] input 入力値
  # @return [Boolean] 数値の場合
  def self.is_integer(input)
    input.to_s() =~ /[0-9]/
  end
  

end

