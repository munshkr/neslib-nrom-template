#include "neslib.h"

// main function, run after console reset
void main(void) {

  // set palette colors
  pal_col(0,0x0f);	// set screen to black
  pal_col(1,0x14);	// fuchsia
  pal_col(2,0x20);	// grey
  pal_col(3,0x30);	// white

  // write text to name table
  vram_adr(NTADR_A(2,2));		// set address
  vram_write("HELLO, WORLD!", 13);	// write bytes to video RAM

  // enable PPU rendering (turn on screen)
  ppu_on_all();

  // infinite loop
  while (1) ;
}
