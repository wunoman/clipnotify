PREFIX ?= /usr/local

x11_bsd_flags = -I/usr/X11R6/include -L/usr/X11R6/lib -L/lib/x86_64-linux-gnu/
static_mode=-static
libs=-lX11 -lxcb -lXfixes -lXau -lXdmcp

all:
	${CC} ${CFLAGS} ${LDFLAGS} clipnotify.c -o clipnotify ${static_mode} ${x11_bsd_flags} ${libs} 

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f clipnotify ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/clipnotify

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/clipnotify

clean:
	rm -f *.o *~ clipnotify
