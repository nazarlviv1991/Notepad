
class Link < Post
  def initialize
    super
    @url = ""
  end

  def read_from_console
    puts "VVedit adres silki"
    @url = STDIN.gets.chomp
    puts "Napishit paru sliv, kuda vede cia silka"
    @text = STDIN.gets.chomp
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y-%m-%d_%H:%M")
    file.puts(time_string + "\n\r")

    file.puts(@url)
    file.puts(@text)

    file.close

    puts "Vasha silka zberezena"
  end
  def to_strings

  end
end