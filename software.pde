#include <avr/delay.h>


void setup() {
  //Serial.begin(9600);
  DDRC = 0x3F;  // HCF Demux output(3) + OE + RST + CLK
  DDRD = 0xFC;  // Data bus
  DDRB = 0x03;  // Data bus
  
  PORTC = ~0x3F;
  PORTC |= _BV(PC5); // RST on
  PORTC |= _BV(PC3); // OE on
}

void toogle_clk(void) {
  PORTC |= _BV(PC4);
  //_delay_ms(5);
  PORTC &= ~_BV(PC4);
}

void reset_cd(void) {
  PORTC |= _BV(PC5);
  //_delay_ms(5);
  PORTC &= ~_BV(PC5);
}

void go_start(void) {
  reset_cd();
  toogle_clk();
}

void add_data(uint8_t data, uint8_t addr) {
  DDRC = addr;
  for(byte i=0; i<8; i++) {
    digitalWrite(i+2, (1 & data>>i));
  }
  if (addr == 7)
    DDRC = 0x00;
  else
    DDRC = addr+1;
}

void oe(uint8_t state) {
  if (state == 0)
    DDRC &= ~_BV(PC3);
  if (state == 1)
    DDRC |= _BV(PC3);
}


void loop() {
  PORTC &= ~_BV(PC5); // RST off
  
  
  // Test for the *MUX-board*
  add_data(1, 0x00);
  add_data(2, 0x01);
  add_data(3, 0x02);
  add_data(4, 0x03);
  add_data(5, 0x04);
  add_data(6, 0x05);
  add_data(7, 0x06);
  add_data(8, 0x07);
  oe(0);

  // Test for the *floor-board*
  /*while(1) {
    go_start();
    _delay_ms(15);
    for(byte i=0; i<7; i++) {
      toogle_clk();
      _delay_ms(15);
    }
  }*/
  
}
