#define F_CPU 16000000UL

#include <util/delay.h>
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

    // This is better.
    PORTD = (data << 2);
    PORTB = (data >> 6);

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

void clean() {
    for(int i=0; i<8; i++) {
        add_data(0x00, i);
    }
}


int main() {
    setup();
    PORTC &= ~_BV(PC5); // RST off

    clean();
    oe(1);
    add_data(0xFF, 0x00);
    add_data(0xFF, 0x01);
    add_data(0xFF, 0x02);
    add_data(0xFF, 0x03);
    add_data(0xFF, 0x04);
    add_data(0xFF, 0x05);
    add_data(0xFF, 0x06);
    add_data(0xFF, 0x07);
    oe(0);

    while(1) {
        go_start();
        _delay_ms(2);
        for(int i=0; i<7; i++) {
            toogle_clk();
            _delay_ms(2);
        }
    }


}
