if __FILE__ == $0
  File.open(ARGV[0], 'r') do |infile|
    while line = infile.gets
      puts line.split(" ").join("\n")
    end
  end
end