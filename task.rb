require "date"

class Task < Post
  def initialize
    super
    @due_data = ""
  end

  def read_from_console
    puts "Shcho vam potribno zrobiti?"
    @text = STDIN.gets.chomp

    puts "Do yakogo chisla vam potribno ce zrobiti?"
    puts "Vkazit datu u formati: 24.02.2023"
    input = STDIN.gets.chomp

    @due_data = Date.parse(input)
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y-%m-%d_%H:%M")
    file.puts (time_string + "\n\r")

    file.puts("Zrobiti do #{@due_data.strftime("%Y-%m-%d")}")
    file.puts(@text)

    file.close

    puts "Vasha zadacha zberezhena"
  end
  def to_strings

  end
end