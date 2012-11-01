require 'date'

raise "Dirty git state" unless `git status | grep modified`.chomp.empty?

n = (Date.today - Date.parse("01-11-2012") + 1).to_i

puts "Smile!"

mplayer = %x(which mplayer).chomp

if mplayer.empty?
  file = "#{ENV['USER']}.jpg"
  command = "imagesnap #{file}"
else
  file = "#{ENV['USER']}.png"
  command = "mplayer -vo png -frames 1 tv:// && mv 00000001.png #{file}"
end

system "#{command} && git add #{file} && git commit -m 'Day #{n}' && git tag day#{"%02d" % n} && git push origin master --tags"
