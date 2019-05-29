puts ARGV.chunk {|arg| File.read(arg)}.map {|f| f[0].split(" ").count{|x| x.to_i.even?}}.sum
