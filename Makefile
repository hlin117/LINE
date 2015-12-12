CC=g++
CFLAGS=-c -Wall -Ic:/gsl
LDFLAGS= -Lc:/gsl -L/opt/local/lib -L/usr/local/Cellar/gsl/1.16
LIBS= -lgsl
SOURCES=line.cpp
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=hello

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@
