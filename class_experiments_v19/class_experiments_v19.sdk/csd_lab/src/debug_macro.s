
.macro DEBUG_MACRO

debugMacro:
	STMFD R13!, {R0-R15}

	ldr r0, =uart_Channel_sts_reg0	//Load UART status register address
	ldr r1, =uart_TX_RX_FIFO0		//Load UART FIFO register address

	ldr	r11, =HexCode
	ldr	r12, =string

	mov r3, #0

printRegisters:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printRegisters			//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldr r8, [R13, r3]

printRegisterName:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printRegisterName	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printRegisterName			//If string is not end, repeat print

	mov r6, #28
	mov r7, #0xF0000000
printHexMain:
	and r9, r8, r7
	mov r9, r9, lsr r6
	add r5, r11, r9
	ldrb r5, [r5]
	strb r5, [r1]			//Store one character from string to Tx FIFO

	cmp r6, #16
	moveq r5, #95
	streqb r5, [r1]

	sub r6, r6, #4
	mov r7, r7, lsr #4
	cmp r6, #-4
	bne printHexMain


	add r3, r3, #4
	cmp r3, #64
	bne printRegisters


	mrs r3, cpsr
printNZCV:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printNZCV	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printNZCV			//If string is not end, repeat print

	and r4, r3, #0xf0000000
	mov r4, r4, lsr #28
	mov r5, #5
	mul r4, r4, r5
	ldr r5, =NZCVCode
	add r5, r5, r4

printNZCVStatus:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printNZCVStatus	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r5], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printNZCVStatus			//If string is not end, repeat print




printAIF:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printAIF	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printAIF			//If string is not end, repeat print

	and r4, r3, #0x000001c0
	mov r4, r4, lsr #6
	mov r5, #4
	mul r4, r4, r5
	ldr r5, =AIFCode
	add r5, r5, r4

printAIFStatus:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printAIFStatus	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r5], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printAIFStatus			//If string is not end, repeat print





printCurrentMode:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printCurrentMode	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printCurrentMode			//If string is not end, repeat print

	and r5, r3, #0x01000000
	mov r4, r5, lsr #23
	and r5, r3, #0x00000020
	add r4, r5, lsr #5
	mov r5, #13
	mul r4, r4, r5
	ldr r5, =CModeCode
	add r5, r5, r4

printCurrentModeStatus:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printCurrentModeStatus	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r5], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printCurrentModeStatus			//If string is not end, repeat print








printMode:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printMode	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printMode			//If string is not end, repeat print

	and r4, r3, #0x0000001f
	cmp r4, #0b10000
	moveq r5, #0
	cmp r4, #0b10001
	moveq r5, #4
	cmp r4, #0b10010
	moveq r5, #8
	cmp r4, #0b10011
	moveq r5, #12
	cmp r4, #0b10110
	moveq r5, #16
	cmp r4, #0b10111
	moveq r5, #20
	cmp r4, #0b11010
	moveq r5, #24
	cmp r4, #0b11011
	moveq r5, #28
	cmp r4, #0b11111
	moveq r5, #32

	mov r4, r5
	ldr r5, =ModeCode
	add r5, r5, r4

printModeStatus:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printModeStatus	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r5], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printModeStatus			//If string is not end, repeat print




	mov r6, #28
	mov r7, #0xF0000000
printCPSR:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printCPSR	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printCPSR			//If string is not end, repeat print

printCPSRStatus:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printCPSRStatus	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	and r9, r3, r7
	mov r9, r9, lsr r6
	add r5, r11, r9
	ldrb r5, [r5]
	strb r5, [r1]			//Store one character from string to Tx FIFO

	cmp r6, #16
	moveq r5, #95
	streqb r5, [r1]

	sub r6, r6, #4
	mov r7, r7, lsr #4
	cmp r6, #-4
	bne printCPSRStatus







printStringLeft:
	ldr r2, [r0]			//Load UART status
	and	r2, r2, #0x8
	cmp	r2, #0x8			//Check if Tx FIFO is empty or not
	bne	printStringLeft	//If Tx FIFO is not empty, loop this until Tx FIFO is empty

	ldrb r4, [r12], #1		//Load one character from string
	strb r4, [r1]			//Store one character from string to Tx FIFO
	cmp r4, #0x00			//Check if string is end
	bne printStringLeft			//If string is not end, repeat print



	ldmfd r13!, {r0-r12}
	ldr r14, [r13, #4]
	ldr r13, [r13]

	mov pc, lr

HexCode:
	.ascii "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"

NZCVCode:
	.ascii "nzcv"
	.byte 0x00
	.ascii "nzcV"
	.byte 0x00
	.ascii "nzCv"
	.byte 0x00
	.ascii "nzCV"
	.byte 0x00
	.ascii "nZcv"
	.byte 0x00
	.ascii "nZcV"
	.byte 0x00
	.ascii "nZCv"
	.byte 0x00
	.ascii "nZCV"
	.byte 0x00
	.ascii "Nzcv"
	.byte 0x00
	.ascii "NzcV"
	.byte 0x00
	.ascii "NzCv"
	.byte 0x00
	.ascii "NzCV"
	.byte 0x00
	.ascii "NZcv"
	.byte 0x00
	.ascii "NZcV"
	.byte 0x00
	.ascii "NZCv"
	.byte 0x00
	.ascii "NZCV"
	.byte 0x00

AIFCode:
	.ascii "aif"
	.byte 0x00
	.ascii "aiF"
	.byte 0x00
	.ascii "aIf"
	.byte 0x00
	.ascii "aIF"
	.byte 0x00
	.ascii "Aif"
	.byte 0x00
	.ascii "AiF"
	.byte 0x00
	.ascii "AIf"
	.byte 0x00
	.ascii "AIF"
	.byte 0x00

ModeCode:
	.ascii "USR"
	.byte 0x00
	.ascii "FIQ"
	.byte 0x00
	.ascii "IRQ"
	.byte 0x00
	.ascii "SVC"
	.byte 0x00
	.ascii "MON"
	.byte 0x00
	.ascii "ABT"
	.byte 0x00
	.ascii "HYP"
	.byte 0x00
	.ascii "UND"
	.byte 0x00
	.ascii "SYS"
	.byte 0x00

CModeCode:
	.ascii "ARM mode"
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.ascii "Thumb mode"
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.ascii "Jazelle mode"
	.byte 0x00
	.ascii "ThumbEE mode"
	.byte 0x00

string:
	.byte 0x0D, 0x0A
	.ascii "-----------------------------------------------------------------------------------------------------"
	.byte 0x0D, 0x0A
	.ascii "r0 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r1 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r2 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r3 = 0x"
	.byte 0x00, 0x0D, 0x0A
	.ascii "r4 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r5 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r6 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r7 = 0x"
	.byte 0x00, 0x0D, 0x0A
	.ascii "r8 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r9 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r10 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r11 = 0x"
	.byte 0x00, 0x0D, 0x0A
	.ascii "r12 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r13 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r14 = 0x"
	.byte 0x00, 0x2C, 0x09
	.ascii "r15 = 0x"
	.byte 0x00, 0x0D, 0x0A
	.ascii "cpsr = "
	.byte 0x00, 0x2C, 0x09
	.byte 0x00, 0x2C, 0x09
	.byte 0x00, 0x2C, 0x09
	.ascii "current mode = "
	.byte 0x00, 0x09
	.ascii " ( =0x"
	.byte 0x00
	.ascii ")"
	.byte 0x0D, 0x0A
	.ascii "-----------------------------------------------------------------------------------------------------"
	.byte 0x0D, 0x0A, 0x00

.endm
