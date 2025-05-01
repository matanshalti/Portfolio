CC = gcc
CFLAGS = -Wall -Wextra -ansi -pedantic-errors -g
OBJS = main.o append.o prepend.o remove.o count.o exit_op.o handlers.o
TARGET = cli_file_editor

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

main.o: main.c handlers.h
	$(CC) $(CFLAGS) -c main.c

append.o: append.c operations.h
	$(CC) $(CFLAGS) -c append.c

prepend.o: prepend.c operations.h
	$(CC) $(CFLAGS) -c prepend.c

remove.o: remove.c operations.h
	$(CC) $(CFLAGS) -c remove.c

count.o: count.c operations.h
	$(CC) $(CFLAGS) -c count.c

exit_op.o: exit_op.c operations.h
	$(CC) $(CFLAGS) -c exit_op.c

handlers.o: handlers.c handlers.h operations.h
	$(CC) $(CFLAGS) -c handlers.c

clean:
	rm -f *.o $(TARGET)

