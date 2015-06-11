# Yf

Yahoo! finance (JP) command-line client
Yahoo!ファイナンスのコマンドラインクライアント

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yf', :git => 'https://github.com/kinumi/yf.git'
```

And then execute:

    $ bundle

## Usage

    $ yf search yahoo
    [4689]         516       +4 (6/11)
    [3686]       1,012       +8 (6/11)
    [2497]       1,595      +24 (6/11)

    $ yf search yahoo --full
    [4689]  ヤフー(株)                                                516       +4 (6/11)
    [3686]  (株)ディー・エル・イー                                  1,012       +8 (6/11)
    [2497]  ユナイテッド(株)                                        1,595      +24 (6/11)
    
    $ yf show 4689
           516       +4 (06/11)

    $ yf search USD
    [AUDUSD=FX]    0.77295 -0.000580 (0:14)
    [EURUSD=FX]    1.12521 -0.006970 (0:14)
    [GBPUSD=FX]    1.55157 -0.000890 (0:14)
    [NZDUSD=FX]    0.69973 -0.007740 (0:14)
    [USDCHF=FX]    0.93502 +0.004290 (0:14)
    [USDHKD=FX]    7.75298 +0.000810 (0:14)
    [USDJPY=FX]    123.634 +0.972000 (0:14)

    $ yf search USD --full
    [AUDUSD=FX] 豪ドル/ドル                                           0.77292 -0.000610 (0:14)
    [EURUSD=FX] ユーロ/ドル                                           1.12512 -0.007060 (0:14)
    [GBPUSD=FX] 英ポンド/ドル                                         1.55147 -0.000990 (0:14)
    [NZDUSD=FX] NZドル/ドル                                           0.69969 -0.007780 (0:14)
    [USDCHF=FX] 米ドル/スイスフラン                                   0.93506 +0.004330 (0:14)
    [USDHKD=FX] 米ドル/香港ドル                                       7.75298 +0.000810 (0:14)
    [USDJPY=FX] 米ドル/円                                             123.636 +0.974000 (0:14)

## Contributing

1. Fork it ( https://github.com/kinumi/yf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
