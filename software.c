#define F_CPU 16000000UL

#include <util/delay.h>
#include <avr/io.h>


void setup() {
    DDRC = 0x3F;        // 0b00111111 HCF Demux output(3) + OE + RST + CLK
    DDRD = 0xFC;        // 0b11111100 Data bus
    DDRB = 0x03;        // 0b00000011 Data bus

    PORTC = ~0x3F;      // PORTC = 0b00000000;
    PORTC |= _BV(PC3);  // OE on - inverting

    reset_cd();
}

void toogle_clk(void) {
    PORTC |= _BV(PC4);
    //_delay_ms(5);     - it works without this, the HC's can handle the speed
    PORTC &= ~_BV(PC4);
}

void reset_cd(void) { // non-inverting
    PORTC |= _BV(PC5);
    //_delay_ms(5);     - it works without this, the HC's can handle the speed
    PORTC &= ~_BV(PC5);
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

// Adds data floor by floor, k is the floor identifier (0 - 7)

void add_xy_data(uint8_t *data, uint8_t k) {
    for (int i=(k << 3), j=0; j<8; i++, j++) {
        add_data(data[i], i);
    }
}

void add_test_data() {
    clean();
    oe(1); // inverting
    //add_data(0b00001111, 0x00);
    //add_data(0b00001001, 0x01);
    //add_data(0b00001001, 0x02);
    //add_data(0b00001111, 0x03);
    add_data(0xff, 0x00);
    add_data(0xff, 0x01);
    add_data(0xff, 0x02);
    add_data(0xff, 0x03);
    add_data(0xff, 0x04);
    add_data(0xff, 0x05);
    add_data(0xff, 0x06);
    add_data(0xff, 0x07);
    oe(0);
}

int main() {
    setup();


    uint8_t cube[64];

    cube[0] = 0b00001111;
    cube[1] = 0b00001001;
    cube[2] = 0b00001001;
    cube[3] = 0b00001111;

    for(int i=4; i<64; i++) {
        cube[i] = 0;
    }


    while(1) {
        reset_cd();
        clean();
        for(int i=0; i<8; i++) {
            add_test_data();
            toogle_clk();
            _delay_ms(3);
        }
        toogle_clk();       // so that there isn't any *dead data* on the 7-th floor
    }


}
