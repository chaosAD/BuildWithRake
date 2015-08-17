
desc 'Make main.exe'
task :main => [ :killer, :killer2, "Main.exe"] do
  puts('dummy')
#  s = ['name', 'quest', 'favorite_color', '', 'speed', 'err/vello.o'].reject{|s| s =~ /(.*)\.o/}.join(' ')
#  puts s
end

desc 'Clean main'
task :clean_main do
  sh "rm -f Main.exe"
  sh "rm -f src/*.o"
end

task :killer2 do
  puts('killer2')
end

task :killer do
  puts('killer')
end

file "src/Main.o" => ["src/Main.c", "src/Silly.h"]  do  |t|
  # Reject any prerequisites ending with .h
  compile_string = "gcc -c " + t.prerequisites.reject{|s| s =~ /(.*)\.h/}.join(' ') + " -o " + t.name
  puts(compile_string)
  sh compile_string
end

file "src/Silly.o" => ["src/Silly.c", "src/Silly.h"]  do |t|
  # Reject any prerequisites ending with .h
  compile_string = "gcc -c " + t.prerequisites.reject{|s| s =~ /(.*)\.h/}.join(' ') + " -o " + t.name
  puts(compile_string)
  sh compile_string
end

file "Main.exe" => ["src/Main.o", "src/Silly.o"]  do |t|
#  compile_string = "gcc src/Silly.o src/Main.o -o " + t.name
  compile_string = "gcc " + t.prerequisites.join(' ') + " -o " + t.name
  puts(compile_string)
  sh compile_string
end
