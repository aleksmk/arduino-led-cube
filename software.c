#define F_CPU 16000000UL

#include <avr/delay.h>
#include <avr/io.h>

void setup() {
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
    PORTC = addr;
    // Dirty, must fix it!
    PORTD |= ((1 & data>>0) << PD2);
    PORTD |= ((1 & data>>1) << PD3);
    PORTD |= ((1 & data>>2) << PD4);
    PORTD |= ((1 & data>>3) << PD5);
    PORTD |= ((1 & data>>4) << PD6);
    PORTD |= ((1 & data>>5) << PD7);
    PORTB |= ((1 & data>>6) << PB0);
    PORTB |= ((1 & data>>7) << PB1);
    if (addr == 7)
        PORTC = 0x00;
    else
        PORTC = addr+1;
}

void oe(uint8_t state) {
    if (state == 0)
        PORTC &= ~_BV(PC3);
    if (state == 1)
        PORTC |= _BV(PC3);
}


int main() {
    setup();
    PORTC &= ~_BV(PC5); // RST off


    // Test for the *MUX-board*
    oe(0);
    add_data(1, 0x00);
    add_data(2, 0x01);
    add_data(4, 0x02);
    add_data(8, 0x03);
    add_data(16, 0x04);
    add_data(32, 0x05);
    add_data(64, 0x06);
    add_data(128, 0x07);

    //  oe(1);
    //  add_data(0xaa, 0x00);
    //oe(1);


    //PORTC = 0x00;

    //digitalWrite(14, 1);

    while(1) {};

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
