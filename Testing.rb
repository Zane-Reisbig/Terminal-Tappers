system("stty raw -echo") #=> Raw mode, no echo
char = STDIN.getc
system("stty -raw echo") #=> Reset terminal mode
puts char
