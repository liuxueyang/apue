
WKDIR=/home/pi/fun/apue/apue.2e
CC=gcc
COMPILE.c=$(CC) $(CFLAGS) $(CPPFLAGS) -c
LINK.c=$(CC) $(CFLAGS) $(CPPFLAGS) $(LDDIR) $(LDFLAGS)
LDDIR=-L$(WKDIR)/lib
LDLIBS=$(WKDIR)/lib/libapue.a $(EXTRALIBS)
CFLAGS=-DLINUX -ansi -I$(WKDIR)/include -Wall -D_GNU_SOURCE $(EXTRA)

# Our library that almost every program needs.
LIB=$(WKDIR)/lib/libapue.a

# Common temp files to delete from each directory.
TEMPFILES=core core.* *.o temp.* *.out typescript* *~ *.exe

pid.o: pid.c
	$(CC) $(CFLAGS) -c pid.c -o pid.o

pid.exe: pid.o
	$(CC) $(CFLAGS) $(LDDIR) pid.c $(LIB) -o pid.exe

cp1.o: cp1.c
	$(CC) $(CFLAGS) -c cp1.c -o cp1.o

cp1.exe: cp1.o
	$(CC) $(CFLAGS) $(LDDIR) cp1.c $(LIB) -o cp1.exe

cp.o: cp.c
	$(CC) $(CFLAGS) -c cp.c -o cp.o

cp.exe: cp.o
	$(CC) $(CFLAGS) $(LDDIR) cp.c $(LIB) -o cp.exe

ls.o: ls.c
	$(CC) $(CFLAGS) -c ls.c -o ls.o

ls.exe: ls.o
	$(CC) $(CFLAGS) $(LDDIR) ls.c $(LIB) -o ls.exe

clean:
	rm -f $(TEMPFILES)
