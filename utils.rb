class Utils
  def self.read_file(day: 1)
    File
      .read(Dir.pwd + "/inputs/#{day}.txt")
      .split("\n")
  end
end