OBJS	= endian.o
CC	?= gcc
CFLAGS	+= -Wall -O
PREFIX	?= /usr/local

all:	endian

endian:	$(OBJS)
	$(CC) -o endian $(OBJS) 

endian.o: endian.c
	$(CC) -c $(CFLAGS) endian.c

reallyclean: clean
	rm -f .*.bak *.bak

clean:
	rm -f *.o endian *.nr *.gmon

install: endian
	install -c -m 0755 endian ${PREFIX}/bin
	mkdir -p ${PREFIX}/man/man1
	install -c -m 0644 endian.1 ${PREFIX}/man/man1
