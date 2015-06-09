#!/usr/bin/env ruby
require 'pry'

class Integer
  def to_bin(width)
    '%0*b' % [width, self]
  end
end

def get_arr arr
  start_at = 175
  space_height = 10
  height = [65, 115, 100, 85, 85]
  top_margin = []
  tmp_arr = []
  
  height = (height.zip(arr).map {|e| e.reduce(:*)} - [0])

  arr.each_with_index do |e, i|
    if top_margin.inject(:+).to_i == 0
      top_margin << e * start_at
      tmp_arr << e * start_at
    else
      if e == 0
        top_margin << 0
      else
        top = tmp_arr.last + height.shift + space_height
        top_margin << top
        tmp_arr << top
      end
    end
  end
  puts top_margin.join(" - ")
end

32.times do |e|
  arr = e.to_bin(5).split(//).map(&:to_i)
  puts arr.to_s
  get_arr arr
  puts "\n"
  puts "\n"
end

