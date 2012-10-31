require 'date'

raise "Dirty git state" unless `git status | grep modified`.chomp.empty?

n = (Date.today - Date.parse("01-11-2012") + 1).to_i

puts "Smile!"

system "imagesnap porras.jpg && git add porras.jpg && git commit -m 'Day #{n}' && git tag day#{"%02d" % n} && git push origin master --tags"