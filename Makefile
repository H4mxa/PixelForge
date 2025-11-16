CC = gcc
CFLAGS = -std=c99 -Iinclude -Wall

SRC = src/main.c src/bmplib.c

OBJ = $(patsubst src/%.c,build/%.o,$(SRC))

TARGET = build/pixelforge

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

build/%.o: src/%.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f build/*.o $(TARGET)
