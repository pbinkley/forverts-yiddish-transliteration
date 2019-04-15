#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require_relative 'lib/yiddishtransliteration.rb'
# require 'byebug'

@yt = YiddishTransliterate.new

def transliterate input
  output = ''
  source = input.text.gsub("ֿ", '').unicode_normalize(:nfc)
  target = ''
  source.split.each do |token|
    trans = @yt.transliterate token
    output += '<div>' + trans + '<br/>' + token + '</div>'
  end
  output
end

source = ARGV[0]

#source = http://yiddish.forward.com/articles/214617/saying-good-by-to-our-treasured-printed-edition/? 

doc = Nokogiri::HTML(open(source))

h1 = transliterate doc.xpath('//h1')

paras = doc.xpath('//div[@id="constrictor"]//p')
paras = paras.first paras.size - 1 # remove last para, which is in English
outputparas = []

paras.each do |para|
  outputtext = transliterate para
  outputparas << outputtext
end

puts '<html><head><meta charset="UTF-8">'
puts '<style type="text/css">.pairwise div { display: inline-block; margin-right: 10px; margin-bottom: 1em; font-size: 150%; } .pairwise { margin-bottom: 2em; direction: rtl; } .h1 { font-size: 200%; }</style>'
puts '</head><body>'
puts '<header><p>Source: <a href="' + source + '">' + source + '</a></p></header>'
puts '<div class="pairwise h1">' + h1 + '</div>'
puts doc.xpath('//h3').to_s
outputparas.each { |para| puts '<div class="pairwise">' + para + '</div>' }
puts '</body></html>'


