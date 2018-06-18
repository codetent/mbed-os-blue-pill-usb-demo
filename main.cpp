/**
 * The example of the program for STM32F103C8T6 (Blue Pill board).
 *
 * This program demonstrate led and usb serial port usage.
 *
 * @author Kochin Konstantin
 */

#include "USBSerial.h"
#include "mbed.h"
#include "stdio.h"

DigitalOut myled(LED1);
USBSerial usbSerial(0x1f00, 0x2012, 0x0001, false);

int main()
{
    uint32_t counter = 0;

    while (true) {
        usbSerial.printf("I am a USB serial port. Tick %d.\n", counter);
        counter++;

        myled = !myled;

        wait_ms(1000);
    }
}
