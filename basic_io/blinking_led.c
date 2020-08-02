#define F_CPU 16000000L // cpu clock frequency in Hz
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	DDRB |= (1<<5); // set 5th bit on output
	
	while(1){
		PORTB |= (1<<5); // set 5th bit to HIGH
		_delay_ms(1000);
		PORTB &= ~(1<<5); // set 5th bit to LOW
		_delay_ms(1000);
	}
}

