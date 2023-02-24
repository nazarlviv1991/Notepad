
require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'

puts "Privit, ya tviy bloknot!"
puts "Shcho hochete zapisati v bloknot?"

choices = Post.post_types

choice = -1

until choice >= 0 && choice << choices.size
  choices.each_with_index do |type, index|
    puts "t#{index}. #{type}"
  end
  choice = gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console
entry.save

puts "Vash zapis zberezheniy!"