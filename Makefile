OBJS    = endian.o
CC      ?= gcc
CFLAGS  ?= -Wall -O
PREFIX  ?= /usr/local

all:    endian

endian: $(OBJS)
	$(CC) -o endian $(OBJS) 

endian.o: endian.c
	$(CC) -c $(CFLAGS) endian.c

reallyclean: clean
	rm -f .*.bak *.bak

clean:
	rm -f *.o endian *.nr *.gmon

install: endian
	mkdir -p ${STAGEDIR}${PREFIX}/bin \
		${STAGEDIR}${PREFIX}/man/man1
	install -c -m 0755 endian ${STAGEDIR}${PREFIX}/bin
	install -c -m 0644 endian.1 ${STAGEDIR}${PREFIX}/man/man1
