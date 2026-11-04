CC      ?= gcc
CFLAGS  ?= -std=gnu11 -O2 -Wall -pthread
LDFLAGS ?=
LDLIBS  ?= -pthread

TARGET  = sync_car
OBJS    = sync_car.o sync_car-runner.o

.PHONY: all clean check test

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

sync_car.o: sync_car.c sync_car.h
	$(CC) $(CFLAGS) -c -o $@ sync_car.c

sync_car-runner.o: sync_car-runner.c sync_car.h
	$(CC) $(CFLAGS) -c -o $@ sync_car-runner.c

check: sync_car.c sync_car.h
	$(CC) -std=gnu11 -O2 -Wall -Wextra -Werror -pthread -c -o /dev/null sync_car.c

test: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) $(OBJS)
