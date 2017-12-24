CC = avr-gcc
CFLAGS = -g -Wall -O2 -mmcu=attiny85

.PHONY: flash
flash: main.hex
	avrdude -c usbasp -p t85 -U flash:w:$^

main.elf: main.c
	$(CC) -o $@ $(CFLAGS) $^ $(LDFLAGS) $(LDLIBS)

main.hex: main.elf
	avr-objcopy -j .text -j .data -O ihex $^ $@

.PHONY: clean
clean:
	$(RM) main.elf main.hex
