require "yf/version"
require "open-uri"
require "thor"
require "nokogiri"

class String
  def mb_size
    each_char.map{|v| v.ascii_only? ? 1 : 2 }.inject(&:+)
  end

  def mb_ljust(width, padding = " ")
    padding_size = [0, width - mb_size].max
    self + padding * padding_size
  end
end

module Yf
  class CLI < Thor
    desc "search KEYWORD", "銘柄を検索します"
    option :full, :type => :boolean
    def search(keyword)
      html = open("http://info.finance.yahoo.co.jp/search/?query=%s" % [URI.encode_www_form_component(keyword)]).read
      hdoc = Nokogiri::HTML(html)
      hdoc.css(".stocks").each do |stock|
        code = stock.css(".code").text
        name = stock.css(".name").text
        price = stock.css(".price").text
        change = stock.css(".change span").first.text
        time = stock.css(".time").text
        #----
        color = change.strip.start_with?("-") ? :green : :red
        price = set_color(price.rjust(10), color)
        change = set_color(change.rjust(8), color)
        #----
        if options[:full]
          printf("%-7s %s %s %s (%s)\n", code, name.mb_ljust(50), price, change, time)
        else
          printf("%-7s %s %s (%s)\n", code, price, change, time)
        end
      end
    rescue
      # nothing to do
    end

    desc "show CODE", "銘柄情報を表示します"
    def show(code)
      html = open("http://stocks.finance.yahoo.co.jp/stocks/detail/?code=%s" % [URI.encode_www_form_component(code)]).read
      hdoc = Nokogiri::HTML(html)
      price = hdoc.css(".stoksPrice").last.text
      change = hdoc.css(".change .yjMSt").text.gsub(/（.*）/, "").strip
      time = hdoc.css(".real span").text
      #----
      color = change.strip.start_with?("-") ? :green : :red
      price = set_color(price.rjust(10), color)
      change = set_color(change.rjust(8), color)
      #----
      printf("%s %s (%s)\n", price, change, time)
    rescue
      # nothing to do
    end
  end
end
