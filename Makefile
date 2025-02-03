
BIN     = endian
OBJS    = endian.o

# Install in ../local, unless defined by the parent Makefile, the
# environment, or a command line option such as PREFIX=/opt/local.
# FreeBSD ports sets this to /usr/local, MacPorts to /opt/local, etc.
PREFIX      ?= ../local

# Where to find local libraries and headers.  If you want to use libraries
# from outside ${PREFIX} (not usually recommended), you can set this
# independently.
LOCALBASE   ?= ${PREFIX}

CC          ?= cc
CFLAGS      ?= -Wall -O
RM          ?= rm
MKDIR       ?= mkdir
INSTALL     ?= install
STRIP       ?= strip

# Allow caller to override either MANPREFIX or MANDIR
MANPREFIX   ?= ${PREFIX}
MANDIR      ?= ${MANPREFIX}/share/man

all:    ${BIN}

${BIN}: ${OBJS}
	${CC} -o ${BIN} ${OBJS} ${LDFLAGS}

endian.o: endian.c
	${CC} -c ${CFLAGS} endian.c

reallyclean: clean
	${RM} -f .*.bak *.bak

clean:
	${RM} -f ${OBJS} ${BIN} *.nr *.gmon

install: ${BIN}
	${MKDIR} -p ${DESTDIR}${PREFIX}/bin \
		${DESTDIR}${MANDIR}/man1
	${INSTALL} -c -m 0755 ${BIN} ${DESTDIR}${PREFIX}/bin
	${INSTALL} -c -m 0644 endian.1 ${DESTDIR}${MANDIR}/man1

install-strip: install
	${STRIP} ${DESTDIR}${PREFIX}/bin/${BIN}
