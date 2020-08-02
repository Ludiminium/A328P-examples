#include <avr/io.h>

int main(void)
{
	DDRB &= ~(1 << DDB4); // Clear the PB4 pin
	// PB4 is now an input

	DDRB |= (1 << DDB5); // Set PB5 pin on output
	// PB5 is now an output

	PORTB |= (1 << PORTB4); // turn On the Pull-up
	// PB4 is now an input with pull-up enabled

	while (1)
	{
		if( (PINB & (1<<PINB4)) == 0){
			// do something when PB4 is on
			PORTB |= (1 << PORTB5);
			// Turn PB5 pin on
		}
		else{
			PORTB &= ~(1 << PORTB5);
			// Clear PB5 pin
		}
	}
}