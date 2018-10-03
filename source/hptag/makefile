CC = gcc
RC = windres
STRIP = strip
COMPRESS = upx

TARGET = hptag

LIBS = 

CFLAGS = -Wall
LDFLAGS = -Wall
COMPRESSFLAGS = -9

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c)) $(patsubst %.rc, %.o, $(wildcard *.rc))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.rc
	$(RC) $< $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) $(LIBS) -o $@
	$(STRIP) $(TARGET).exe
	$(COMPRESS) $(COMPRESSFLAGS) $(TARGET).exe
	
clean:
	-del *.o $(TARGET).exe 2> nul
