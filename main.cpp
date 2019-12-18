/*
 * This is an example program for using the USB connection
 * of the STM32F103C8 board as a virtual COM Port.
 * 
 */

#include "mbed.h"
#include "USBSerial.h"

DigitalOut myled(LED1);
USBSerial serial;

int main()
{
    char buf[128];

    while (true) {
        // Read and send it back
        serial.scanf("%s", buf);
        serial.printf("-> %s\n", buf);

        // Toggle LED
        myled = !myled;
    }
}
