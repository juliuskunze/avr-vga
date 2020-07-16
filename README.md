# avr-vga

![Example dislay output](https://imgur.com/0lapQU9.jpg)

Programs the ATtiny2313 microcontroller to produce a 800x600, 60Hz VGA signal via carefully timed machine instructions.

Supports a 16x16 resolution (restricted by the 128 Byte RAM) with 8 colors (could do 16).

## Hardware

The ATtiny2313 needs to be connected to a 10MHz clock.
5 output pins need to be connected to the corresponding VGA pins, with voltage lowered via appropriate resistors.

## Deployment

Install avrdude and avra. Build and deploy with

```shell
avra vga.asm
avrdude -U lfuse:w:0xE0:m
avrdude -c usbasp -p t2313 -U flash:w:vga.hex
```
