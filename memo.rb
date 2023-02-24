class Memo < Post

  def read_from_console
    puts "Ya zberezhu vse shcho ti napishesh doryadka \"end\" y fail"
    line = nil

    while line != "end" do
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
end