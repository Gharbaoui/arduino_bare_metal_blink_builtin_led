main:
	mkdir -p bin
	avr-gcc	-Os -DF_CPU=16000000UL	-mmcu=atmega328p -c -o ./bin/main.o ./src/main.c
	avr-gcc	-o ./bin/main.bin ./bin/main.o
	avr-objcopy -O ihex -R .eeprom ./bin/main.bin ./bin/main.hex

upload: main
	sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyUSB0 -b 115200 -U flash:w:bin/main.hex
