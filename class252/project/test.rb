time_start = Time.now

a = []
for i in 0..1000000
	a.push(['a','b','c','d','e','f','g'])
end

time_end = Time.now
require "os"
puts "#{OS.rss_bytes / 1024} MB"
puts "#{(time_end - time_start)} sec"



