# Arm Mbed OS - Blue Pill USB Demo

## Description

This project is an USB demo programm for the "blue pill" STM32F103C8 board.
It is based on the USB Stack provided by Mbed for the controller. Because this board is mostly shipped with a 128KB version of the controller the linker file has been replaced by the one from Konstantin Kochin ([Link]("https://os.mbed.com/users/vznncv/code/STM32F103C8T6_USBSerial_Demo/rev/24604e97c40c/")).

## Requirements

- GNU Arm Embedded Toolchain
- STM32 ST-LINK Utility
- mbed-cli
- optional: GNU Make For Windows

## Instructions

Clone the repository with all included submodules.
```
git clone --recursive https://github.com/codetent/mbed-os-blue-pill-usb-demo.git
```

Build & Flash

```
make run
```

## Tested with

| Name | Version |
| ---- | ------- |
| GNU Arm Embedded Toolchain | v7 2017-q4-major |
| STM32 ST-LINK Utility | 4.2.0.0 |
| Mbed CLI for Windows | 0.4.3 |
| GnuWin32 | 3.81 |