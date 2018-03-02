# FizzBuzzLocal


### FizzBuzz

For numbers 1 through 100
If you assign args under 100, 1 throuth args number

- if the number is divisible by 3 print Fizz
- if the number is divisible by 5 print Buzz
- if the number is divisible by 3 and 5 print FizzBuzz
- else, print the number

### About This Branch Specification

- test code is not required yet
- strings Fizz,Buzz and divide number 3,5 is changeable
- number of strings and divide number pair is changeable
- default print numbers range is 1 to 100
- user can specify print numbers length
- specified value should be falls within default range

### メモ

- 未実装

yaml読むっぽい感じの、作ってない
入力をデフォルト値にする設定入れたいけど作ってない
範囲もconfigにしたい気がするけど作ってない

- 要修正

utilities雑に作ってるけど果たしていいのか
validation関係は外部化したいけど整理すら出来てない
IO関係と内部処理の分離がきちんといってない
initializeする時に各メソッドが順番依存している問題解決してない