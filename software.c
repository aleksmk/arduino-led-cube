#define F_CPU 16000000UL

#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

uint8_t cube[64];
volatile int addr = 0;

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
/* initialize timer interrupt */
void init_isr_timers(void) {
  /* OC1A/OC1B disconnected */
  TCCR1A = 0;
  /* CTC mode, top in OCR1A / Timer clock = CLK/1024 */
  TCCR1B = (1<<WGM12)|(1<<CS12)|(1<<CS10);
  /* set OCR1A top value for ~ 480 Hz (~ 60 Hz for whole cube) */
  /*   32 for CPU @ 16 MHz */
  OCR1A = 20;
  /* enable Timer/Counter 1 interrupt */
  TIMSK1 = (1<<OCIE1A);
}


/* timer/counter 1 interrupt handler */
ISR(TIMER1_COMPA_vect) {
    if (addr == 0) {
        reset_floor_counter();
    }
    for(int k=0; k<8; k++) {
        output_data(cube[addr + k], k);
    }
    toggle_floor_clock();
    addr += 8;
    if (addr == 64) {
        addr = 0;
    }
}


void setup_ports(void) {
    DDRC = 0x3F;        // 0b00111111 HCF Demux output(3) + OE + RST + CLK
    DDRD = 0xFC;        // 0b11111100 Data bus
    DDRB = 0x03;        // 0b00000011 Data bus

    PORTC = ~0x3F;      // PORTC = 0b00000000;
    PORTC |= _BV(PC3);  // OE on - inverting
}


int main(void) {
    setup_ports();
    reset_floor_counter();
    init_isr_timers();
    sei();

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
    }


}
