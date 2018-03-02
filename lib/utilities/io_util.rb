# coding: utf-8
require "yaml"


module IoUtil

  CONFIG_DIR = File.expand_path("../../config", __FILE__)

  # yamlを読んでハッシュマップとして取得する
  #
  # @param file_name ファイル名
  # @param path ファイルが置いてあるディレクトリのパス デフォルト値はconfig
  # @return [Hash] ハッシュオブジェクト
  def self.get_hash_by_yaml(file_name, path=CONFIG_DIR)
    return open(path + "/" +  file_name, "r") { |f| YAML.load(f) }
  end

  # 標準入力を取得する
  #
  # @param message 入力を促すメッセージ
  # @return [String] 標準入力からの文字列 
  def self.get_string_by_stdin(message="")
    p message
    return gets.chomp!
  end

end
