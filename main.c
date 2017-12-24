#define F_CPU 1000000UL  // 1 MHz

#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>

int main(int argc, char *argv[])
{
        DDRB |= (1 << DDB3);
        while (true) {
                _delay_ms(100);
                PORTB ^= (1 << PORTB3);
                _delay_ms(1000);
                PORTB ^= (1 << PORTB3);
        }
        return 0;
}
