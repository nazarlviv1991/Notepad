require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'
require "optparse"

options = {}

OptionParser.new do |opt|
  opt.banner = "Usage: read_post.rb [options]"

  opt.on("-h", "Prints this help") do
    puts opt
    exit
  end

  opt.on("--type POST_TYPE", "Yakiy tip postiv pokazati (po zamovchuvanu lubiy)") { |o| options[:type] = o }
  opt.on("--id POST_ID", "Yakshcho zadaniy id - pokazuem tilki cei post") { |o| options[:id] = o }
  opt.on("--limit NUMBER", "Skilki ostanih postiv pokazati (po zamovchuvanu vsi)") { |o| options[:limit] = o }
end.parse!

if !options[:id].nil?
  result = Post.find_by_id(options[:id])

  puts "Zapis #{result.class.name}, id = #{options[:id]}"

  result.to_strings.each do |line|
    puts line
  end

else
  result = Post.find_all(options[:limit], options[:type])

  print "| id\t| @type\t| @created_at\t\t\t| @text \t\t\t| @url\t\t| @due_date \t "

  result.each do |row|
    puts
    row.each do |element|
      print "| #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end
  end
end

puts