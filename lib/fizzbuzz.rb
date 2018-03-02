require "fizzbuzz/version"
require "utilities/number_util"
require "utilities/io_util"

module FizzBuzz

  class FizzBuzz 
    include NumberUtil
    include IoUtil
    
    def initialize(fizzbuzz_file="fizzbuzz.yml")
      @min_number = 1
      @max_number = 100
      # TODO: validate fizz buzz
      @@fizz_buzz = IoUtil.get_hash_by_yaml(fizzbuzz_file)
      @@start_number = initialize_start_number()
      @@end_number = initialize_end_number()
      @@divisors = initialize_config_divisors()
    end

    # 定義された約数一覧の配列を取得する
    # 
    # TODO: initializeの順番依存関係を要整理
    # @return [Array] 定義された約数一覧
    def initialize_config_divisors()
      @@fizz_buzz.map{ |key, value| key }
    end

    # 入力の最小値を求める
    #
    # TODO: initializeの順番依存関係
    # TODO: 整数化のタイミングと外部化
    # @return [Integer] 最小値の標準入力を整数にしたもの
    def initialize_start_number()
      message =  "Please input minimum number over " + @min_number.to_s()
      start_number = IoUtil.get_string_by_stdin(message)
      validate_integer(start_number)
      validate_start_number_length(start_number)
      start_number.to_i()
    end

    #　入力の最大値を求める
    #
    # TODO: initializeの順番依存関係
    # TODO: 整数化のタイミングと外部化
    # @return [Integer] 最大値の標準入力を整数にしたもの
    def initialize_end_number()
      message = "Please input max number over " + @@start_number.to_s() + " and under " + @max_number.to_s()
      end_number = IoUtil.get_string_by_stdin(message)
      validate_integer(end_number)
      validate_end_number_length(end_number) 
      end_number.to_i()
    end

    # 整数か値バリデーション
    # TODO: 汎用的なバリデーションは外部化検討少なくともIOとプロセス終了は共通化
    def validate_integer(input)
      if !NumberUtil.is_integer(input)
        puts "Input should be integer!"
        exit_process()
      end
    end

    # 開始番号の値の幅バリデーション
    def validate_start_number_length(start_number)
      validate_over_min_number(start_number)
      validate_under_max_number(start_number)
    end

    # 終了番号の値の幅バリデーション
    def validate_end_number_length(end_number)
      puts end_number
      puts "--validation--"
      validate_over_start_number(end_number)
      validate_under_max_number(end_number)
    end


    def validate_over_min_number(input)
      if input.to_i() < @min_number
        puts "Input should be over " + @min_number.to_s()
        exit_process()
      end
    end

    def validate_under_max_number(input)
      if input.to_i() > @max_number
        puts "Input should be under " + @max_number.to_s()
        exit_process()
      end
    end

    def validate_over_start_number(input)
      puts @@start_number
      if input.to_i() < @@start_number
        puts "Input should be over " + @@start_number.to_s()
        exit_process()
      end
    end

    # プロセスを終了させる
    def exit_process()
      puts "--Process exit--"
      exit!
    end


    # @fizz_buzzの定義で約数に該当する文字列を置き換えて返す
    #
    # @param [Integer] number 数字
    # @return [String] 置換ルール適用後の文字列置換,置換ルールに引っかからなかった場合は空文字
    def get_replaced_string(number)
      divisors = NumberUtil.get_divisors(number, @@divisors)
      replaced_string = @@fizz_buzz.select{ |key, value| divisors.include?(key) }.map{ |key, value| @@fizz_buzz[key] }.join
    end

    # @fizz_buzz置換した文字は文字列で、それ以外は数字で標準出力を行う
    #
    def print_each_fizzbuzz(number)
      if get_replaced_string(number).empty?
        puts number
      else
        puts get_replaced_string(number)
      end
    end

    # 指定範囲内でFizzBuzzを出力する
    #
    def print_fizzbuzz()
      puts "--Start FizzBuzz output--"
      @@start_number.upto(@@end_number) do |num|
        print_each_fizzbuzz(num)
      end
      puts "--Finished FizzBuzz output--"
    end

  end

end
