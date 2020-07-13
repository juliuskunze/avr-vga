#include<avr/io.h>
#include<avr/interrupt.h>

#define LED PB3

ISR (TIMER1_COMPA_vect)
{
	PORTB ^= (1 << LED);
}

int main()
{
	DDRB = (0x01 << LED);     //Configure the PORTD4 as output

	OCR1A = 7812 + 1;   // for 1 sec
	TCCR1A = 0x00;
	TCCR1B = (1<<WGM12) | (1<<CS10) | (1<<CS12);  // Timer mode with 1024 prescler
	TIMSK = (1 << OCIE1A); // Enable output compare A interrupt
	sei();        // Enable global interrupts by setting global interrupt enable bit in SREG

	while(1)
	{

	}
}
