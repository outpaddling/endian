
BIN     = endian
OBJS    = endian.o
CC      ?= cc
CFLAGS  ?= -Wall -O

# Install in ../local, unless defined by the parent Makefile, the
# environment, or a command line option such as PREFIX=/opt/local.
# FreeBSD ports sets this to /usr/local, MacPorts to /opt/local, etc.
PREFIX      ?= ../local

# Where to find local libraries and headers.  If you want to use libraries
# from outside ${PREFIX} (not usually recommended), you can set this
# independently.
LOCALBASE   ?= ${PREFIX}

# Allow caller to override either MANPREFIX or MANDIR
MANPREFIX   ?= ${PREFIX}
MANDIR      ?= ${MANPREFIX}/share/man

all:    ${BIN}

${BIN}: ${OBJS}
	${CC} -o ${BIN} ${OBJS} ${LDFLAGS}

endian.o: endian.c
	${CC} -c ${CFLAGS} endian.c

reallyclean: clean
	rm -f .*.bak *.bak

clean:
	rm -f ${OBJS} ${BIN} *.nr *.gmon

install: ${BIN}
	mkdir -p ${DESTDIR}${PREFIX}/bin \
		${DESTDIR}${MANDIR}/man1
	install -c -m 0755 ${BIN} ${DESTDIR}${PREFIX}/bin
	install -c -m 0644 endian.1 ${DESTDIR}${MANDIR}/man1
