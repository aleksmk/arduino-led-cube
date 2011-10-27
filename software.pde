#include <avr/delay.h>

//#define CLK PORTC
//#define RST PORTC

void setup() {
  //Serial.begin(9600);
  DDRC = 0x3F;
  DDRD = 0xFC;
  DDRB = 0x03;
  
  PORTC = ~0x3F;
  //PORTC &= ~_BV(PC4); // гасиме clk
  PORTC |= _BV(PC5); // го држиме RST на 1.  
}

void toogle_clk(void) {
  PORTC |= _BV(PC4);
  _delay_ms(5);
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


void loop() {
  PORTC &= ~_BV(PC5); // gasime RST
  
  while(1) {
    go_start();
    _delay_ms(15);
    for(byte i=0; i<7; i++) {
      toogle_clk();
      _delay_ms(15);
    }
  }
}
