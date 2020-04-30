int csd_main()
{
	unsigned* switchPointer = (unsigned*)0x00101900;	//Load switch I/O memory address
	unsigned* timerMemory = (unsigned*)0x001019d0;		//Load timer information memory address

	//Get switch status and set timer information depends on switch status
	if(*switchPointer == 49) { *timerMemory = 0x04333333; }
	else if(*switchPointer == 50) { *timerMemory = 0x08666666; }
	else if(*switchPointer == 51) { *timerMemory = 0x0c999999; }
	else if(*switchPointer == 52) { *timerMemory = 0x10cccccc; }
	else if(*switchPointer == 53) { *timerMemory = 0x14ffffff; }
	else if(*switchPointer == 54) { *timerMemory = 0x19333332; }
	else if(*switchPointer == 55) { *timerMemory = 0x1d666665; }
	else if(*switchPointer == 56) { *timerMemory = 0x2a000000; }

	return 0;
}
