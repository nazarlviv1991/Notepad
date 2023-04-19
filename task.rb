require "date"

class Task < Post
  def initialize
    super
    @due_date = ""
  end

  def read_from_console
    puts "Shcho vam potribno zrobiti?"
    @text = STDIN.gets.chomp

    puts "Do yakogo chisla vam potribno ce zrobiti?"
    puts "Vkazit datu u formati: 24.02.2023"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y-%m-%d_%H:%M")
    file.puts (time_string + "\n\r")

    file.puts("Zrobiti do #{@due_date.strftime("%Y-%m-%d")}")
    file.puts(@text)

    file.close

    puts "Vasha zadacha zberezhena"
  end
  def to_strings
    deadline = "Kraibiy termin: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Stvoreno: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    [deadline, @text, time_string]
  end

  def to_db_hash
    return super.merge(
      {
        "text" => @text,
        "due_date" => @due_date.to_s
      }
    )
  end

  def load_data(data_hash)
    super
    @due_date = Date.parse(data_hash["due_date"])
    #@text = data_hash["text"].split("\n\r")
  end
end