.INCLUDE "tn2313def.inc"

Main:
  .equ B = 0
  .equ G = 1
  .equ R = 2
  .equ H = 3
  .equ V = 4
  .equ RAMSTART = 0x60
  .def zero = r0
  .def count = r17
  .def temp = r18
  .def border = r19
  .def porch = r20
  .def hsync = r21
  .def vsync = r22
  .def xsync = r23
  clr r0
  ldi border, 1 << B
  ldi porch, 0
  ldi hsync, 1 << H
  ldi vsync, 1 << V
  ldi xsync, (1 << H) | (1 << V)
  ldi temp, 0b00011111
  out DDRB, temp

  ldi temp, 1 << R
  clr xh
  ldi xl, RAMSTART
  ldi count, 128
DataLoaderLoop:
  st x+, temp
  dec count
  brne DataLoaderLoop

VBlank:

;  out PORTB, border   ; 1
;  ldi count, 9        ; 1
;RightBorderLoop:
;  dec count           ; 1*
;  brne RightBorderLoop; 1*      +28=200

Line:                 ;         0
  ldi xl, RAMSTART    ; 1 TODO

  out PORTB, border   ; 1
  ldi count, 7        ; 1
LeftBorderLoop:
  dec count           ; 1*
  brne LeftBorderLoop ; 2* -1
  nop                 ; 2
  nop

  ldi count, 8        ; 1
DataLoop:
  ld temp, x          ; 2*
  andi temp, 7        ; 1*      +28=28
  out PORTB, temp     ; 1*
  ld temp, x+         ; 2*
  swap temp           ; 1*
  andi temp, 7        ; 1*
  nop
  nop
  nop
  nop                 ; 4*
  out PORTB, temp     ; 1*
  dec count           ; 1*
  nop
  nop                 ; 2*
  brne DataLoop       ; 2* -1
  nop
  nop
  nop
  nop
  nop                 ; 5       +144=172

  out PORTB, border   ; 1
  ldi count, 9        ; 1
RightBorderLoop:
  dec count           ; 1*
  brne RightBorderLoop; 1*      +28=200

  out PORTB, porch    ; 1
  ldi count, 3        ; 1
FrontPorchLoop:
  dec count           ; 1*
  brne FrontPorchLoop ; 2* -1   +10=210

  out PORTB, hsync    ; 1
  ldi count, 10       ; 1
  nop                 ; 1
HSyncLoop:
  dec count           ; 1*
  brne HsyncLoop      ; 2* -1   +32=242

  out PORTB, porch    ; 1
  ldi count, 6        ; 1
  nop                 ; 1
BackPorchLoop:
  dec count           ; 1*
  brne BackPorchLoop  ; 2* -1

  rjmp Line           ; 2       +22=264