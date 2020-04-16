int csd_main()
{
	unsigned* switchPointer = (unsigned*)0x41210000;
	unsigned* timerMemory = (unsigned*)0x001019d0;

	if(*switchPointer & 0b10000000)
	{
		*timerMemory = 0x04333333;
	}
	else if(*switchPointer & 0b01000000)
	{
		*timerMemory = 0x08666666;
	}
	else if(*switchPointer & 0b00100000)
	{
		*timerMemory = 0x0c999999;
	}
	else if(*switchPointer & 0b00010000)
	{
		*timerMemory = 0x10cccccc;
	}
	else if(*switchPointer & 0b00001000)
	{
		*timerMemory = 0x14ffffff;
	}
	else if(*switchPointer & 0b00000100)
	{
		*timerMemory = 0x19333332;
	}
	else if(*switchPointer & 0b00000010)
	{
		*timerMemory = 0x1d666665;
	}
	else if(*switchPointer & 0b00000001)
	{
		*timerMemory = 0x21999998;
	}
	else
	{
		*timerMemory = 0x2a000000;
	}
	return 0;
}
