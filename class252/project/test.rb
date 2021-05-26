time_start = Time.now
a = []
for i in 0..1000000
	a.push(i)
end
time_end = Time.now
require "os"
puts "memory usage: #{OS.rss_bytes / 1024} MB"
puts "execution time: #{(time_end - time_start)} sec"



