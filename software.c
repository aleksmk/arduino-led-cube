#define F_CPU 16000000UL

#include <util/delay.h>
#include <avr/io.h>

void reset_floor_counter(void);

void setup(void) {
    DDRC = 0x3F;        // 0b00111111 HCF Demux output(3) + OE + RST + CLK
    DDRD = 0xFC;        // 0b11111100 Data bus
    DDRB = 0x03;        // 0b00000011 Data bus

    PORTC = ~0x3F;      // PORTC = 0b00000000;
    PORTC |= _BV(PC3);  // OE on - inverting

    reset_floor_counter();
}

void toggle_floor_clock(void) {
    PORTC |= _BV(PC4);
    //_delay_ms(5);     - it works without this, the HC's can handle the speed
    PORTC &= ~_BV(PC4);
}

void reset_floor_counter(void) { // non-inverting
    PORTC |= _BV(PC5);
    //_delay_ms(5);     - it works without this, the HC's can handle the speed
    PORTC &= ~_BV(PC5);
}


void output_data(uint8_t data, uint8_t addr) {
    PORTC = addr;

    // This is better.
    PORTD = (data << 2);
    PORTB = (data >> 6);

    // toggle the address bus
    if (addr == 7)
        PORTC = 0x00;
    else
        PORTC = addr+1;
}

void output_enable(uint8_t state) {
    if (state == 0)
        PORTC &= ~_BV(PC3);
    if (state == 1)
        PORTC |= _BV(PC3);
}

void reset_data_buffers(void) {
    for(int i=0; i<8; i++) {
        output_data(0x00, i);
    }
}


int main(void) {
    setup();


    uint8_t cube[64];

    cube[0] = 0b00001111;
    cube[1] = 0b00001111;
    cube[2] = 0b00001111;
    cube[3] = 0b00001111;

    for(int i=4; i<64; i++) {
        cube[i] = 0;
    }

    cube[8] = 0b00001111;
    cube[9] = 0b00001001;
    cube[10]= 0b00001001;
    cube[11]= 0b00001111;


    cube[16] = 0b00001111;
    cube[17] = 0b00001001;
    cube[18] = 0b00001001;
    cube[19] = 0b00001111;

    cube[60] = 0b11110000;
    cube[61] = 0b10010000;
    cube[62] = 0b10010000;
    cube[63] = 0b11110000;

    while(1) {
        reset_floor_counter();
        // reset_data_buffers();
        for(int k=0; k<64; k++) {
            output_data(cube[k], k & 0b0111);
            if (k % 8 == 7) {
                toggle_floor_clock();
                _delay_ms(1);
            }
        }
    }


}
