
desc 'Make main.exe'
task :main => [ :killer, :killer2, "Main.exe"] do
  puts('dummy')
end

desc 'Clean main'
task :clean_main do
  sh "rm Main.exe"
  sh "rm src/*.o"
end

task :killer2 do
  puts('killer2')
end

task :killer do
  puts('killer')
end

file "src/Main.o" => ["src/Main.c", "src/Silly.h"]  do
  compile_string = "gcc -c src/Main.c -o src/Main.o"
  puts(compile_string)
  sh compile_string
end

file "src/Silly.o" => ["src/Silly.c", "src/Silly.h"]  do
  compile_string = "gcc -c src/Silly.c -o src/Silly.o"
  puts(compile_string)
  sh compile_string
end

file "Main.exe" => ["src/Main.o", "src/Silly.o"]  do
  compile_string = "gcc src/Silly.o src/Main.o -o Main.exe"
  puts(compile_string)
  sh compile_string  
end
