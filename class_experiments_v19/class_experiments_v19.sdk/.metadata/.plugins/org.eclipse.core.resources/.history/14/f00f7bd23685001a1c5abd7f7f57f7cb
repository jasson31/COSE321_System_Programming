//Author : Jaemin Son
//Date : 2020/4/18

#define csd_LED_ADDR 0x41200000
#define timerMemory 0x001019d0

.extern csd_main

.global main
main:
 	ldr r6, =csd_LED_ADDR	//Load led I/O memory address
 	ldr r7, =timerMemory	//Load timer information memory address
 	mov r4, #0b00000001		//Set initial LED status to 1

forever:
 	str r4, [r6]			//Update LED status
 	bl csd_main				//Get current switch information and update timer
 	ldr r5, [r7]			//Update timer

 rotation:
	lsl r4, r4, #1			//Shift LED status left by 1
	cmp r4, #0b10000000		//Check if LED status is over LED range
	bgt rotateByte			//IF LED status is over LED range, reset LED status to 1

timer:
	subs r5, r5, #1			//Decrease timer count
	bne timer				//If timer count is 0, end timer

 	b forever				//Repeat the program

rotateByte:
	mov r4, #1				//Reset LED status to 1
	b timer					//Return

