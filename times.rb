#!/usr/bin/env ruby

require 'json'

def check(x, fn)
  open(fn, 'w') do |f|
    last = 0
    x.results.items.each do |word|
      next if word.type == 'punctuation'
      t = word.start_time.to_f - last
      last = word.end_time.to_f
      f.puts t.round(3) if t > 0.0111
      # puts word.alternatives.first.content
    end
  end
end

x = JSON.parse(File.read('PatRyder10052023Intro.wav.json'), {object_class: OpenStruct})
y = JSON.parse(File.read('PatRyder10052023Answer1.wav.json'), {object_class: OpenStruct})

check x, 'a.txt'
check y, 'b.txt'

