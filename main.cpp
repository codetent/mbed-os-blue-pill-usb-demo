/*
 * This is an example programm for using the USB connection
 * of the STM32F103C8 board as a virtual COM Port.
 * 
 */

#include "mbed.h"
#include "USBSerial.h"

DigitalOut myled(LED1);
USBSerial serial;

int main()
{
    while (true) {
        // Print message over Virtual COM Port
        serial.printf("Hello USB!\n");

        // Toggle LED
        myled = !myled;

        wait_ms(1000);
    }
}
