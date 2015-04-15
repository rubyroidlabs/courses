NAME=winner

CC=gcc
CFLAGS=-ggdb -std=gnu99 -Wall

default: build

run: build
	@./$(NAME) $1 $2 $3

build: clean
	@echo Building...
	@$(CC) $(CFLAGS) -o $(NAME) *.c $(LIBS)

clean:
	@echo Cleaning...
	@rm -f $(NAME) $(NAME).o
