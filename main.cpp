#include "mbed.h"
#include "USBSerial.h"

DigitalOut myled(LED1);
USBSerial serial(0x1f00, 0x2012, 0x0001, false);

int main()
{
    while (true) {
        serial.printf("Hello USB!\n");

        myled = !myled;

        wait_ms(1000);
    }
}
