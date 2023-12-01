class Utils
  def self.read_file(day: 1, year: 2023)
    puts Dir.pwd

    File
      .read(Dir.pwd + "/#{year}/inputs/#{day}.txt")
      .split("\n")
  end
end