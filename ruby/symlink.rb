#!/usr/bin/env ruby

d = Dir.glob('*/.*').reject{|n| n =~ %r!/((\.git)|(\.{1,2}))$! }
d.each do |f|
  puts file = Dir.pwd + '/' + f
  `ln -s #{file} ~/`
end
