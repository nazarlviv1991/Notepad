class Memo < Post

  def initialize
    super
  end

  def read_from_console
    puts "Ya zberezhu vse shcho ti napishesh do ryadka \"end\" y fail"
    line = nil

    until line == "end"
      line = STDIN.gets.chomp
      @text << line
    end
    @text.pop
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y-%m-%d_%H:%M")
    file.puts(time_string + "\n\r")

    for item in @text do
      file.puts(item)
    end
    file.close

    puts "Vash zapis zberezeniy"
  end

  def to_db_hash
    return super.merge(
      {
        "text" => @text.join("\n\r")
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @text = data_hash["text"].split("\n\r")
  end

  def to_strings

    time_string = "Stvoreno: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"
    @text.unshift(time_string)
  end

end