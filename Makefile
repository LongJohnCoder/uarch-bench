.PHONY: all clean

HEADERS = $(wildcard *.h) $(wildcard *.hpp) 

CPPFLAGS = -g -O2 -march=native

all: uarch-bench

clean:
	rm -f *.o uarch-bench
	
uarch-bench: main.o x86_methods.o
	g++ $(CPPFLAGS) $^ -o uarch-bench
	
%.o : %.cpp $(HEADERS) 
	g++ $(CPPFLAGS) -c -std=c++11 -o $@ $<

x86_methods.o: x86_methods.asm
	nasm -w+all -f elf64 -l x86_methods.list x86_methods.asm

