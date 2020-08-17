
;CodeVisionAVR C Compiler V2.05.0 Evaluation
;(C) Copyright 1998-2010 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type                : ATxmega128A1
;Program type             : Application
;Clock frequency          : 2.000000 MHz
;Memory model             : Small
;Optimize for             : Size
;(s)printf features       : int, width
;(s)scanf features        : int, width
;External RAM size        : 0
;Data Stack size          : 2048 byte(s)
;Heap size                : 0 byte(s)
;Promote 'char' to 'int'  : Yes
;'char' is unsigned       : Yes
;8 bit enums              : Yes
;global 'const' stored in FLASH: No
;Enhanced core instructions    : On
;Smart register allocation     : On
;Automatic register allocation : On

	#pragma AVRPART ADMIN PART_NAME ATxmega128A1
	#pragma AVRPART MEMORY PROG_FLASH 135168
	#pragma AVRPART MEMORY EEPROM 2048
	#pragma AVRPART MEMORY INT_SRAM SIZE 16383
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x2000

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU CCP=0x34
	.EQU RAMPD=0x38
	.EQU RAMPX=0x39
	.EQU RAMPY=0x3A
	.EQU RAMPZ=0x3B
	.EQU EIND=0x3C
	.EQU WDT_CTRL=0x80
	.EQU PMIC_CTRL=0xA2
	.EQU NVM_ADDR0=0X01C0
	.EQU NVM_ADDR1=NVM_ADDR0+1
	.EQU NVM_ADDR2=NVM_ADDR1+1
	.EQU NVM_DATA0=NVM_ADDR0+4
	.EQU NVM_CMD=NVM_ADDR0+0xA
	.EQU NVM_CTRLA=NVM_ADDR0+0xB
	.EQU NVM_CTRLB=NVM_ADDR0+0xC
	.EQU NVM_STATUS=NVM_ADDR0+0xF
	.EQU PORTCFG_MPCMASK=0xB0
	.EQU PORTH_DIR=0x6E0
	.EQU PORTH_OUT=0x6E4
	.EQU PORTH_PIN0CTRL=0x6F0
	.EQU PORTJ_DIR=0x700
	.EQU PORTJ_OUT=0x704
	.EQU PORTJ_PIN0CTRL=0x710
	.EQU PORTK_DIR=0x720
	.EQU PORTK_OUT=0x724
	.EQU PORTK_PIN0CTRL=0x730
	.EQU EBI_CTRL=0x0440
	.EQU EBI_SDRAMCTRLA=EBI_CTRL+1
	.EQU EBI_REFRESHL=EBI_CTRL+4
	.EQU EBI_REFRESHH=EBI_CTRL+5
	.EQU EBI_INITDLYL=EBI_CTRL+6
	.EQU EBI_INITDLYH=EBI_CTRL+7
	.EQU EBI_SDRAMCTRLB=EBI_CTRL+8
	.EQU EBI_SDRAMCTRLC=EBI_CTRL+9
	.EQU EBI_CS0_CTRLA=EBI_CTRL+0x10
	.EQU EBI_CS0_CTRLB=EBI_CS0_CTRLA+1
	.EQU EBI_CS0_BASEADDRL=EBI_CS0_CTRLA+2
	.EQU EBI_CS0_BASEADDRH=EBI_CS0_CTRLA+3
	.EQU EBI_CS1_CTRLA=EBI_CTRL+0x14
	.EQU EBI_CS1_CTRLB=EBI_CS1_CTRLA+1
	.EQU EBI_CS1_BASEADDRL=EBI_CS1_CTRLA+2
	.EQU EBI_CS1_BASEADDRH=EBI_CS1_CTRLA+3
	.EQU EBI_CS2_CTRLA=EBI_CTRL+0x18
	.EQU EBI_CS2_CTRLB=EBI_CS2_CTRLA+1
	.EQU EBI_CS2_BASEADDRL=EBI_CS2_CTRLA+2
	.EQU EBI_CS2_BASEADDRH=EBI_CS2_CTRLA+3
	.EQU EBI_CS3_CTRLA=EBI_CTRL+0x1C
	.EQU EBI_CS3_CTRLB=EBI_CS3_CTRLA+1
	.EQU EBI_CS3_BASEADDRL=EBI_CS3_CTRLA+2
	.EQU EBI_CS3_BASEADDRH=EBI_CS3_CTRLA+3
	.EQU EBI_SDCAS_bp=3
	.EQU EBI_SDCAS_bm=8
	.EQU EBI_SDROW_bp=2
	.EQU EBI_SDROW_bm=4
	.EQU EBI_SDCOL_bp=0
	.EQU EBI_MRDLY_bp=6
	.EQU EBI_ROWCYCDLY_bp=3
	.EQU EBI_RPDLY_bp=0
	.EQU EBI_WRDLY_bp=6
	.EQU EBI_ESRDLY_bp=3
	.EQU EBI_ROWCOLDLY_bp=0
	.EQU EBI_CS_SDSREN_bm=4
	.EQU EBI_CS_ASPACE_256B_gc=0x00<<2
	.EQU EBI_CS_ASPACE_512B_gc=0x01<<2
	.EQU EBI_CS_ASPACE_1KB_gc=0x02<<2
	.EQU EBI_CS_ASPACE_2KB_gc=0x03<<2
	.EQU EBI_CS_ASPACE_4KB_gc=0x04<<2
	.EQU EBI_CS_ASPACE_8KB_gc=0x05<<2
	.EQU EBI_CS_ASPACE_16KB_gc=0x06<<2
	.EQU EBI_CS_ASPACE_32KB_gc=0x07<<2
	.EQU EBI_CS_ASPACE_64KB_gc=0x08<<2
	.EQU EBI_CS_ASPACE_128KB_gc=0x09<<2
	.EQU EBI_CS_ASPACE_256KB_gc=0x0A<<2
	.EQU EBI_CS_ASPACE_512KB_gc=0x0B<<2
	.EQU EBI_CS_ASPACE_1MB_gc=0x0C<<2
	.EQU EBI_CS_ASPACE_2MB_gc=0x0D<<2
	.EQU EBI_CS_ASPACE_4MB_gc=0x0E<<2
	.EQU EBI_CS_ASPACE_8MB_gc=0x0F<<2
	.EQU EBI_CS_ASPACE_16M_gc=0x10<<2
	.EQU EBI_CS_MODE_DISABLED_gc=0x00
	.EQU EBI_CS_MODE_SRAM_gc=0x01
	.EQU EBI_CS_MODE_LPC_gc=0x02
	.EQU EBI_CS_MODE_SDRAM_gc=0x03
	.EQU EBI_SDDATAW_4BIT_gc=0x00<<6
	.EQU EBI_SDDATAW_8BIT_gc=0x01<<6
	.EQU EBI_LPCMODE_ALE1_gc=0x00<<4
	.EQU EBI_LPCMODE_ALE12_gc=0x02<<4
	.EQU EBI_SRMODE_ALE1_gc=0x00<<2
	.EQU EBI_SRMODE_ALE2_gc=0x01<<2
	.EQU EBI_SRMODE_ALE12_gc=0x02<<2
	.EQU EBI_SRMODE_NOALE_gc=0x03<<2
	.EQU EBI_IFMODE_DISABLED_gc=0x00
	.EQU EBI_IFMODE_3PORT_gc=0x01
	.EQU EBI_IFMODE_4PORT_gc=0x02
	.EQU EBI_IFMODE_2PORT_gc=0x03
	.EQU EBI_SDCOL_8BIT_gc=0x00
	.EQU EBI_SDCOL_9BIT_gc=0x01
	.EQU EBI_SDCOL_10BIT_gc=0x02
	.EQU EBI_SDCOL_11BIT_gc=0x03
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F
	.EQU GPIO0=0x00
	.EQU GPIO1=0x01
	.EQU GPIO2=0x02
	.EQU GPIO3=0x03
	.EQU GPIO4=0x04
	.EQU GPIO5=0x05
	.EQU GPIO6=0x06
	.EQU GPIO7=0x07
	.EQU GPIO8=0x08
	.EQU GPIO9=0x09
	.EQU GPIO10=0x0A
	.EQU GPIO11=0x0B
	.EQU GPIO12=0x0C
	.EQU GPIO13=0x0D
	.EQU GPIO14=0x0E
	.EQU GPIO15=0x0F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x2000
	.EQU __SRAM_END=0x3FFF
	.EQU __DSTACK_SIZE=0x0800
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __GETD1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X+
	LD   R22,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF __lcd_x=R3
	.DEF __lcd_y=R2
	.DEF __lcd_maxx=R5

;GPIO0-GPIO15 INITIALIZATION VALUES
	.EQU __GPIO0_INIT=0x00
	.EQU __GPIO1_INIT=0x00
	.EQU __GPIO2_INIT=0x00
	.EQU __GPIO3_INIT=0x00
	.EQU __GPIO4_INIT=0x00
	.EQU __GPIO5_INIT=0x00
	.EQU __GPIO6_INIT=0x00
	.EQU __GPIO7_INIT=0x00
	.EQU __GPIO8_INIT=0x00
	.EQU __GPIO9_INIT=0x00
	.EQU __GPIO10_INIT=0x00
	.EQU __GPIO11_INIT=0x00
	.EQU __GPIO12_INIT=0x00
	.EQU __GPIO13_INIT=0x00
	.EQU __GPIO14_INIT=0x00
	.EQU __GPIO15_INIT=0x00

;GLOBAL REGISTER VARIABLES INITIALIZATION VALUES
	.EQU __R2_INIT=0x00
	.EQU __R3_INIT=0x00
	.EQU __R4_INIT=0x00
	.EQU __R5_INIT=0x00
	.EQU __R6_INIT=0x00
	.EQU __R7_INIT=0x00
	.EQU __R8_INIT=0x00
	.EQU __R9_INIT=0x00
	.EQU __R10_INIT=0x00
	.EQU __R11_INIT=0x00
	.EQU __R12_INIT=0x00
	.EQU __R13_INIT=0x00
	.EQU __R14_INIT=0x00

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_0x0:
	.DB  0x59,0x6F,0x75,0x20,0x61,0x72,0x65,0x20
	.DB  0x77,0x65,0x6C,0x63,0x6F,0x6D,0x65,0x0
_0x2000003:
	.DB  0x80,0xC0

__GLOBAL_INI_TBL:
	.DW  0x02
	.DW  __base_y_G100
	.DW  _0x2000003*2

_0xFFFFFFFF:
	.DW  0

__RESET:
	CLI
	CLR  R30
	OUT  RAMPD,R30
	OUT  RAMPX,R30
	OUT  RAMPY,R30

;MEMORY MAPPED EEPROM ACCESS IS USED
	LDS  R31,NVM_CTRLB
	ORI  R31,0x08
	STS  NVM_CTRLB,R31

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,0xD8
	OUT  CCP,R31
	STS  PMIC_CTRL,R30

;NO EXTERNAL RAM IS USED
	STS  EBI_CTRL,R30

;DISABLE WATCHDOG
	LDS  R26,WDT_CTRL
	CBR  R26,2
	SBR  R26,1
	OUT  CCP,R31
	STS  WDT_CTRL,R26

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,LOW(__SRAM_START)
	LDI  R27,HIGH(__SRAM_START)
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

	OUT  RAMPZ,R24

;GPIO0-GPIO15 INITIALIZATION
	LDI  R30,__GPIO0_INIT
	OUT  GPIO0,R30
	;__GPIO1_INIT = __GPIO0_INIT
	OUT  GPIO1,R30
	;__GPIO2_INIT = __GPIO0_INIT
	OUT  GPIO2,R30
	;__GPIO3_INIT = __GPIO0_INIT
	OUT  GPIO3,R30
	;__GPIO4_INIT = __GPIO0_INIT
	OUT  GPIO4,R30
	;__GPIO5_INIT = __GPIO0_INIT
	OUT  GPIO5,R30
	;__GPIO6_INIT = __GPIO0_INIT
	OUT  GPIO6,R30
	;__GPIO7_INIT = __GPIO0_INIT
	OUT  GPIO7,R30
	;__GPIO8_INIT = __GPIO0_INIT
	OUT  GPIO8,R30
	;__GPIO9_INIT = __GPIO0_INIT
	OUT  GPIO9,R30
	;__GPIO10_INIT = __GPIO0_INIT
	OUT  GPIO10,R30
	;__GPIO11_INIT = __GPIO0_INIT
	OUT  GPIO11,R30
	;__GPIO12_INIT = __GPIO0_INIT
	OUT  GPIO12,R30
	;__GPIO13_INIT = __GPIO0_INIT
	OUT  GPIO13,R30
	;__GPIO14_INIT = __GPIO0_INIT
	OUT  GPIO14,R30
	;__GPIO15_INIT = __GPIO0_INIT
	OUT  GPIO15,R30

;GLOBAL REGISTER VARIABLES INITIALIZATION
	;__R2_INIT = __GPIO0_INIT
	MOV  R2,R30
	;__R3_INIT = __GPIO0_INIT
	MOV  R3,R30
	;__R5_INIT = __GPIO0_INIT
	MOV  R5,R30

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x2800

	.CSEG
;/*****************************************************
;This program was produced by the
;CodeWizardAVR V2.05.0 Evaluation
;Automatic Program Generator
;© Copyright 1998-2010 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;Version :
;Date    : 6/6/2018
;Author  : Freeware, for evaluation and non-commercial use only
;Company :
;Comments:
;
;
;Chip type               : ATxmega128A1
;Program type            : Application
;AVR Core Clock frequency: 2.000000 MHz
;Memory model            : Small
;Data Stack size         : 2048
;*****************************************************/
;
;// I/O Registers definitions
;#include <io.h>
;
;// Alphanumeric LCD interface functions
;#include <alcd.h>
;
;// Declare your global variables here
;
;// System Clocks initialization
;void system_clocks_init(void)
; 0000 0021 {

	.CSEG
_system_clocks_init:
; 0000 0022 unsigned char n,s;
; 0000 0023 
; 0000 0024 // Optimize for speed
; 0000 0025 #pragma optsize-
; 0000 0026 // Save interrupts enabled/disabled state
; 0000 0027 s=SREG;
	ST   -Y,R17
	ST   -Y,R16
;	n -> R17
;	s -> R16
	IN   R16,63
; 0000 0028 // Disable interrupts
; 0000 0029 #asm("cli")
	cli
; 0000 002A 
; 0000 002B // Internal 2 MHz RC oscillator initialization
; 0000 002C // Enable the internal 2 MHz RC oscillator
; 0000 002D OSC.CTRL|=OSC_RC2MEN_bm;
	LDS  R30,80
	ORI  R30,1
	STS  80,R30
; 0000 002E 
; 0000 002F // System Clock prescaler A division factor: 1
; 0000 0030 // System Clock prescalers B & C division factors: B:1, C:1
; 0000 0031 // ClkPer4: 2000.000 kHz
; 0000 0032 // ClkPer2: 2000.000 kHz
; 0000 0033 // ClkPer:  2000.000 kHz
; 0000 0034 // ClkCPU:  2000.000 kHz
; 0000 0035 n=(CLK.PSCTRL & (~(CLK_PSADIV_gm | CLK_PSBCDIV1_bm | CLK_PSBCDIV0_bm))) |
; 0000 0036 	CLK_PSADIV_1_gc | CLK_PSBCDIV_1_1_gc;
	LDS  R30,65
	ANDI R30,LOW(0x80)
	MOV  R17,R30
; 0000 0037 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 0038 CLK.PSCTRL=n;
	STS  65,R17
; 0000 0039 
; 0000 003A // Disable the autocalibration of the internal 2 MHz RC oscillator
; 0000 003B DFLLRC2M.CTRL&= ~DFLL_ENABLE_bm;
	LDS  R30,104
	ANDI R30,0xFE
	STS  104,R30
; 0000 003C 
; 0000 003D // Wait for the internal 2 MHz RC oscillator to stabilize
; 0000 003E while ((OSC.STATUS & OSC_RC2MRDY_bm)==0);
_0x3:
	LDS  R30,81
	ANDI R30,LOW(0x1)
	BREQ _0x3
; 0000 003F 
; 0000 0040 // Select the system clock source: 2 MHz Internal RC Osc.
; 0000 0041 n=(CLK.CTRL & (~CLK_SCLKSEL_gm)) | CLK_SCLKSEL_RC2M_gc;
	LDS  R30,64
	ANDI R30,LOW(0xF8)
	MOV  R17,R30
; 0000 0042 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 0043 CLK.CTRL=n;
	STS  64,R17
; 0000 0044 
; 0000 0045 // Disable the unused oscillators: 32 MHz, 32 kHz, external clock/crystal oscillator, PLL
; 0000 0046 OSC.CTRL&= ~(OSC_RC32MEN_bm | OSC_RC32KEN_bm | OSC_XOSCEN_bm | OSC_PLLEN_bm);
	LDS  R30,80
	ANDI R30,LOW(0xE1)
	STS  80,R30
; 0000 0047 
; 0000 0048 // Peripheral Clock output: Disabled
; 0000 0049 PORTCFG.CLKEVOUT=(PORTCFG.CLKEVOUT & (~PORTCFG_CLKOUT_gm)) | PORTCFG_CLKOUT_OFF_gc;
	LDS  R30,180
	ANDI R30,LOW(0xFC)
	STS  180,R30
; 0000 004A 
; 0000 004B // Restore interrupts enabled/disabled state
; 0000 004C SREG=s;
	OUT  0x3F,R16
; 0000 004D // Restore optimization for size if needed
; 0000 004E #pragma optsize_default
; 0000 004F }
	LD   R16,Y+
	LD   R17,Y+
	RET
;
;// Ports initialization
;void ports_init(void)
; 0000 0053 {
_ports_init:
; 0000 0054 // PORTA initialization
; 0000 0055 // OUT register
; 0000 0056 PORTA.OUT=0x00;
	LDI  R30,LOW(0)
	STS  1540,R30
; 0000 0057 // Bit0: Input
; 0000 0058 // Bit1: Input
; 0000 0059 // Bit2: Input
; 0000 005A // Bit3: Input
; 0000 005B // Bit4: Input
; 0000 005C // Bit5: Input
; 0000 005D // Bit6: Input
; 0000 005E // Bit7: Input
; 0000 005F PORTA.DIR=0x00;
	STS  1536,R30
; 0000 0060 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0061 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0062 // Bit0 inverted: Off
; 0000 0063 // Bit0 slew rate limitation: Off
; 0000 0064 PORTA.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1552,R30
; 0000 0065 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0066 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0067 // Bit1 inverted: Off
; 0000 0068 // Bit1 slew rate limitation: Off
; 0000 0069 PORTA.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1553,R30
; 0000 006A // Bit2 Output/Pull configuration: Totempole/No
; 0000 006B // Bit2 Input/Sense configuration: Sense both edges
; 0000 006C // Bit2 inverted: Off
; 0000 006D // Bit2 slew rate limitation: Off
; 0000 006E PORTA.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1554,R30
; 0000 006F // Bit3 Output/Pull configuration: Totempole/No
; 0000 0070 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0071 // Bit3 inverted: Off
; 0000 0072 // Bit3 slew rate limitation: Off
; 0000 0073 PORTA.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1555,R30
; 0000 0074 // Bit4 Output/Pull configuration: Totempole/No
; 0000 0075 // Bit4 Input/Sense configuration: Sense both edges
; 0000 0076 // Bit4 inverted: Off
; 0000 0077 // Bit4 slew rate limitation: Off
; 0000 0078 PORTA.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1556,R30
; 0000 0079 // Bit5 Output/Pull configuration: Totempole/No
; 0000 007A // Bit5 Input/Sense configuration: Sense both edges
; 0000 007B // Bit5 inverted: Off
; 0000 007C // Bit5 slew rate limitation: Off
; 0000 007D PORTA.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1557,R30
; 0000 007E // Bit6 Output/Pull configuration: Totempole/No
; 0000 007F // Bit6 Input/Sense configuration: Sense both edges
; 0000 0080 // Bit6 inverted: Off
; 0000 0081 // Bit6 slew rate limitation: Off
; 0000 0082 PORTA.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1558,R30
; 0000 0083 // Bit7 Output/Pull configuration: Totempole/No
; 0000 0084 // Bit7 Input/Sense configuration: Sense both edges
; 0000 0085 // Bit7 inverted: Off
; 0000 0086 // Bit7 slew rate limitation: Off
; 0000 0087 PORTA.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1559,R30
; 0000 0088 // Interrupt 0 level: Disabled
; 0000 0089 // Interrupt 1 level: Disabled
; 0000 008A PORTA.INTCTRL=(PORTA.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 008B 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1545
	ANDI R30,LOW(0xF0)
	STS  1545,R30
; 0000 008C // Bit0 pin change interrupt 0: Off
; 0000 008D // Bit1 pin change interrupt 0: Off
; 0000 008E // Bit2 pin change interrupt 0: Off
; 0000 008F // Bit3 pin change interrupt 0: Off
; 0000 0090 // Bit4 pin change interrupt 0: Off
; 0000 0091 // Bit5 pin change interrupt 0: Off
; 0000 0092 // Bit6 pin change interrupt 0: Off
; 0000 0093 // Bit7 pin change interrupt 0: Off
; 0000 0094 PORTA.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1546,R30
; 0000 0095 // Bit0 pin change interrupt 1: Off
; 0000 0096 // Bit1 pin change interrupt 1: Off
; 0000 0097 // Bit2 pin change interrupt 1: Off
; 0000 0098 // Bit3 pin change interrupt 1: Off
; 0000 0099 // Bit4 pin change interrupt 1: Off
; 0000 009A // Bit5 pin change interrupt 1: Off
; 0000 009B // Bit6 pin change interrupt 1: Off
; 0000 009C // Bit7 pin change interrupt 1: Off
; 0000 009D PORTA.INT1MASK=0x00;
	STS  1547,R30
; 0000 009E 
; 0000 009F // PORTB initialization
; 0000 00A0 // OUT register
; 0000 00A1 PORTB.OUT=0x00;
	STS  1572,R30
; 0000 00A2 // Bit0: Input
; 0000 00A3 // Bit1: Input
; 0000 00A4 // Bit2: Input
; 0000 00A5 // Bit3: Input
; 0000 00A6 // Bit4: Input
; 0000 00A7 // Bit5: Input
; 0000 00A8 // Bit6: Input
; 0000 00A9 // Bit7: Input
; 0000 00AA PORTB.DIR=0x00;
	STS  1568,R30
; 0000 00AB // Bit0 Output/Pull configuration: Totempole/No
; 0000 00AC // Bit0 Input/Sense configuration: Sense both edges
; 0000 00AD // Bit0 inverted: Off
; 0000 00AE // Bit0 slew rate limitation: Off
; 0000 00AF PORTB.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1584,R30
; 0000 00B0 // Bit1 Output/Pull configuration: Totempole/No
; 0000 00B1 // Bit1 Input/Sense configuration: Sense both edges
; 0000 00B2 // Bit1 inverted: Off
; 0000 00B3 // Bit1 slew rate limitation: Off
; 0000 00B4 PORTB.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1585,R30
; 0000 00B5 // Bit2 Output/Pull configuration: Totempole/No
; 0000 00B6 // Bit2 Input/Sense configuration: Sense both edges
; 0000 00B7 // Bit2 inverted: Off
; 0000 00B8 // Bit2 slew rate limitation: Off
; 0000 00B9 PORTB.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1586,R30
; 0000 00BA // Bit3 Output/Pull configuration: Totempole/No
; 0000 00BB // Bit3 Input/Sense configuration: Sense both edges
; 0000 00BC // Bit3 inverted: Off
; 0000 00BD // Bit3 slew rate limitation: Off
; 0000 00BE PORTB.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1587,R30
; 0000 00BF // Bit4 Output/Pull configuration: Totempole/No
; 0000 00C0 // Bit4 Input/Sense configuration: Sense both edges
; 0000 00C1 // Bit4 inverted: Off
; 0000 00C2 // Bit4 slew rate limitation: Off
; 0000 00C3 PORTB.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1588,R30
; 0000 00C4 // Bit5 Output/Pull configuration: Totempole/No
; 0000 00C5 // Bit5 Input/Sense configuration: Sense both edges
; 0000 00C6 // Bit5 inverted: Off
; 0000 00C7 // Bit5 slew rate limitation: Off
; 0000 00C8 PORTB.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1589,R30
; 0000 00C9 // Bit6 Output/Pull configuration: Totempole/No
; 0000 00CA // Bit6 Input/Sense configuration: Sense both edges
; 0000 00CB // Bit6 inverted: Off
; 0000 00CC // Bit6 slew rate limitation: Off
; 0000 00CD PORTB.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1590,R30
; 0000 00CE // Bit7 Output/Pull configuration: Totempole/No
; 0000 00CF // Bit7 Input/Sense configuration: Sense both edges
; 0000 00D0 // Bit7 inverted: Off
; 0000 00D1 // Bit7 slew rate limitation: Off
; 0000 00D2 PORTB.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1591,R30
; 0000 00D3 // Interrupt 0 level: Disabled
; 0000 00D4 // Interrupt 1 level: Disabled
; 0000 00D5 PORTB.INTCTRL=(PORTB.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 00D6 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1577
	ANDI R30,LOW(0xF0)
	STS  1577,R30
; 0000 00D7 // Bit0 pin change interrupt 0: Off
; 0000 00D8 // Bit1 pin change interrupt 0: Off
; 0000 00D9 // Bit2 pin change interrupt 0: Off
; 0000 00DA // Bit3 pin change interrupt 0: Off
; 0000 00DB // Bit4 pin change interrupt 0: Off
; 0000 00DC // Bit5 pin change interrupt 0: Off
; 0000 00DD // Bit6 pin change interrupt 0: Off
; 0000 00DE // Bit7 pin change interrupt 0: Off
; 0000 00DF PORTB.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1578,R30
; 0000 00E0 // Bit0 pin change interrupt 1: Off
; 0000 00E1 // Bit1 pin change interrupt 1: Off
; 0000 00E2 // Bit2 pin change interrupt 1: Off
; 0000 00E3 // Bit3 pin change interrupt 1: Off
; 0000 00E4 // Bit4 pin change interrupt 1: Off
; 0000 00E5 // Bit5 pin change interrupt 1: Off
; 0000 00E6 // Bit6 pin change interrupt 1: Off
; 0000 00E7 // Bit7 pin change interrupt 1: Off
; 0000 00E8 PORTB.INT1MASK=0x00;
	STS  1579,R30
; 0000 00E9 
; 0000 00EA // PORTC initialization
; 0000 00EB // OUT register
; 0000 00EC PORTC.OUT=0x00;
	STS  1604,R30
; 0000 00ED // Bit0: Input
; 0000 00EE // Bit1: Input
; 0000 00EF // Bit2: Input
; 0000 00F0 // Bit3: Input
; 0000 00F1 // Bit4: Input
; 0000 00F2 // Bit5: Input
; 0000 00F3 // Bit6: Input
; 0000 00F4 // Bit7: Input
; 0000 00F5 PORTC.DIR=0x00;
	STS  1600,R30
; 0000 00F6 // Bit0 Output/Pull configuration: Totempole/No
; 0000 00F7 // Bit0 Input/Sense configuration: Sense both edges
; 0000 00F8 // Bit0 inverted: Off
; 0000 00F9 // Bit0 slew rate limitation: Off
; 0000 00FA PORTC.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1616,R30
; 0000 00FB // Bit1 Output/Pull configuration: Totempole/No
; 0000 00FC // Bit1 Input/Sense configuration: Sense both edges
; 0000 00FD // Bit1 inverted: Off
; 0000 00FE // Bit1 slew rate limitation: Off
; 0000 00FF PORTC.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1617,R30
; 0000 0100 // Bit2 Output/Pull configuration: Totempole/No
; 0000 0101 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0102 // Bit2 inverted: Off
; 0000 0103 // Bit2 slew rate limitation: Off
; 0000 0104 PORTC.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1618,R30
; 0000 0105 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0106 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0107 // Bit3 inverted: Off
; 0000 0108 // Bit3 slew rate limitation: Off
; 0000 0109 PORTC.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1619,R30
; 0000 010A // Bit4 Output/Pull configuration: Totempole/No
; 0000 010B // Bit4 Input/Sense configuration: Sense both edges
; 0000 010C // Bit4 inverted: Off
; 0000 010D // Bit4 slew rate limitation: Off
; 0000 010E PORTC.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1620,R30
; 0000 010F // Bit5 Output/Pull configuration: Totempole/No
; 0000 0110 // Bit5 Input/Sense configuration: Sense both edges
; 0000 0111 // Bit5 inverted: Off
; 0000 0112 // Bit5 slew rate limitation: Off
; 0000 0113 PORTC.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1621,R30
; 0000 0114 // Bit6 Output/Pull configuration: Totempole/No
; 0000 0115 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0116 // Bit6 inverted: Off
; 0000 0117 // Bit6 slew rate limitation: Off
; 0000 0118 PORTC.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1622,R30
; 0000 0119 // Bit7 Output/Pull configuration: Totempole/No
; 0000 011A // Bit7 Input/Sense configuration: Sense both edges
; 0000 011B // Bit7 inverted: Off
; 0000 011C // Bit7 slew rate limitation: Off
; 0000 011D PORTC.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1623,R30
; 0000 011E // Interrupt 0 level: Disabled
; 0000 011F // Interrupt 1 level: Disabled
; 0000 0120 PORTC.INTCTRL=(PORTC.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0121 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1609
	ANDI R30,LOW(0xF0)
	STS  1609,R30
; 0000 0122 // Bit0 pin change interrupt 0: Off
; 0000 0123 // Bit1 pin change interrupt 0: Off
; 0000 0124 // Bit2 pin change interrupt 0: Off
; 0000 0125 // Bit3 pin change interrupt 0: Off
; 0000 0126 // Bit4 pin change interrupt 0: Off
; 0000 0127 // Bit5 pin change interrupt 0: Off
; 0000 0128 // Bit6 pin change interrupt 0: Off
; 0000 0129 // Bit7 pin change interrupt 0: Off
; 0000 012A PORTC.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1610,R30
; 0000 012B // Bit0 pin change interrupt 1: Off
; 0000 012C // Bit1 pin change interrupt 1: Off
; 0000 012D // Bit2 pin change interrupt 1: Off
; 0000 012E // Bit3 pin change interrupt 1: Off
; 0000 012F // Bit4 pin change interrupt 1: Off
; 0000 0130 // Bit5 pin change interrupt 1: Off
; 0000 0131 // Bit6 pin change interrupt 1: Off
; 0000 0132 // Bit7 pin change interrupt 1: Off
; 0000 0133 PORTC.INT1MASK=0x00;
	STS  1611,R30
; 0000 0134 
; 0000 0135 // PORTD initialization
; 0000 0136 // OUT register
; 0000 0137 PORTD.OUT=0x00;
	STS  1636,R30
; 0000 0138 // Bit0: Input
; 0000 0139 // Bit1: Input
; 0000 013A // Bit2: Input
; 0000 013B // Bit3: Input
; 0000 013C // Bit4: Input
; 0000 013D // Bit5: Input
; 0000 013E // Bit6: Input
; 0000 013F // Bit7: Input
; 0000 0140 PORTD.DIR=0x00;
	STS  1632,R30
; 0000 0141 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0142 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0143 // Bit0 inverted: Off
; 0000 0144 // Bit0 slew rate limitation: Off
; 0000 0145 PORTD.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1648,R30
; 0000 0146 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0147 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0148 // Bit1 inverted: Off
; 0000 0149 // Bit1 slew rate limitation: Off
; 0000 014A PORTD.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1649,R30
; 0000 014B // Bit2 Output/Pull configuration: Totempole/No
; 0000 014C // Bit2 Input/Sense configuration: Sense both edges
; 0000 014D // Bit2 inverted: Off
; 0000 014E // Bit2 slew rate limitation: Off
; 0000 014F PORTD.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1650,R30
; 0000 0150 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0151 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0152 // Bit3 inverted: Off
; 0000 0153 // Bit3 slew rate limitation: Off
; 0000 0154 PORTD.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1651,R30
; 0000 0155 // Bit4 Output/Pull configuration: Totempole/No
; 0000 0156 // Bit4 Input/Sense configuration: Sense both edges
; 0000 0157 // Bit4 inverted: Off
; 0000 0158 // Bit4 slew rate limitation: Off
; 0000 0159 PORTD.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1652,R30
; 0000 015A // Bit5 Output/Pull configuration: Totempole/No
; 0000 015B // Bit5 Input/Sense configuration: Sense both edges
; 0000 015C // Bit5 inverted: Off
; 0000 015D // Bit5 slew rate limitation: Off
; 0000 015E PORTD.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1653,R30
; 0000 015F // Bit6 Output/Pull configuration: Totempole/No
; 0000 0160 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0161 // Bit6 inverted: Off
; 0000 0162 // Bit6 slew rate limitation: Off
; 0000 0163 PORTD.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1654,R30
; 0000 0164 // Bit7 Output/Pull configuration: Totempole/No
; 0000 0165 // Bit7 Input/Sense configuration: Sense both edges
; 0000 0166 // Bit7 inverted: Off
; 0000 0167 // Bit7 slew rate limitation: Off
; 0000 0168 PORTD.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1655,R30
; 0000 0169 // Interrupt 0 level: Disabled
; 0000 016A // Interrupt 1 level: Disabled
; 0000 016B PORTD.INTCTRL=(PORTD.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 016C 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1641
	ANDI R30,LOW(0xF0)
	STS  1641,R30
; 0000 016D // Bit0 pin change interrupt 0: Off
; 0000 016E // Bit1 pin change interrupt 0: Off
; 0000 016F // Bit2 pin change interrupt 0: Off
; 0000 0170 // Bit3 pin change interrupt 0: Off
; 0000 0171 // Bit4 pin change interrupt 0: Off
; 0000 0172 // Bit5 pin change interrupt 0: Off
; 0000 0173 // Bit6 pin change interrupt 0: Off
; 0000 0174 // Bit7 pin change interrupt 0: Off
; 0000 0175 PORTD.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1642,R30
; 0000 0176 // Bit0 pin change interrupt 1: Off
; 0000 0177 // Bit1 pin change interrupt 1: Off
; 0000 0178 // Bit2 pin change interrupt 1: Off
; 0000 0179 // Bit3 pin change interrupt 1: Off
; 0000 017A // Bit4 pin change interrupt 1: Off
; 0000 017B // Bit5 pin change interrupt 1: Off
; 0000 017C // Bit6 pin change interrupt 1: Off
; 0000 017D // Bit7 pin change interrupt 1: Off
; 0000 017E PORTD.INT1MASK=0x00;
	STS  1643,R30
; 0000 017F 
; 0000 0180 // PORTE initialization
; 0000 0181 // OUT register
; 0000 0182 PORTE.OUT=0x00;
	STS  1668,R30
; 0000 0183 // Bit0: Input
; 0000 0184 // Bit1: Input
; 0000 0185 // Bit2: Input
; 0000 0186 // Bit3: Input
; 0000 0187 // Bit4: Input
; 0000 0188 // Bit5: Input
; 0000 0189 // Bit6: Input
; 0000 018A // Bit7: Input
; 0000 018B PORTE.DIR=0x00;
	STS  1664,R30
; 0000 018C // Bit0 Output/Pull configuration: Totempole/No
; 0000 018D // Bit0 Input/Sense configuration: Sense both edges
; 0000 018E // Bit0 inverted: Off
; 0000 018F // Bit0 slew rate limitation: Off
; 0000 0190 PORTE.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1680,R30
; 0000 0191 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0192 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0193 // Bit1 inverted: Off
; 0000 0194 // Bit1 slew rate limitation: Off
; 0000 0195 PORTE.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1681,R30
; 0000 0196 // Bit2 Output/Pull configuration: Totempole/No
; 0000 0197 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0198 // Bit2 inverted: Off
; 0000 0199 // Bit2 slew rate limitation: Off
; 0000 019A PORTE.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1682,R30
; 0000 019B // Bit3 Output/Pull configuration: Totempole/No
; 0000 019C // Bit3 Input/Sense configuration: Sense both edges
; 0000 019D // Bit3 inverted: Off
; 0000 019E // Bit3 slew rate limitation: Off
; 0000 019F PORTE.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1683,R30
; 0000 01A0 // Bit4 Output/Pull configuration: Totempole/No
; 0000 01A1 // Bit4 Input/Sense configuration: Sense both edges
; 0000 01A2 // Bit4 inverted: Off
; 0000 01A3 // Bit4 slew rate limitation: Off
; 0000 01A4 PORTE.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1684,R30
; 0000 01A5 // Bit5 Output/Pull configuration: Totempole/No
; 0000 01A6 // Bit5 Input/Sense configuration: Sense both edges
; 0000 01A7 // Bit5 inverted: Off
; 0000 01A8 // Bit5 slew rate limitation: Off
; 0000 01A9 PORTE.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1685,R30
; 0000 01AA // Bit6 Output/Pull configuration: Totempole/No
; 0000 01AB // Bit6 Input/Sense configuration: Sense both edges
; 0000 01AC // Bit6 inverted: Off
; 0000 01AD // Bit6 slew rate limitation: Off
; 0000 01AE PORTE.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1686,R30
; 0000 01AF // Bit7 Output/Pull configuration: Totempole/No
; 0000 01B0 // Bit7 Input/Sense configuration: Sense both edges
; 0000 01B1 // Bit7 inverted: Off
; 0000 01B2 // Bit7 slew rate limitation: Off
; 0000 01B3 PORTE.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1687,R30
; 0000 01B4 // Interrupt 0 level: Disabled
; 0000 01B5 // Interrupt 1 level: Disabled
; 0000 01B6 PORTE.INTCTRL=(PORTE.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 01B7 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1673
	ANDI R30,LOW(0xF0)
	STS  1673,R30
; 0000 01B8 // Bit0 pin change interrupt 0: Off
; 0000 01B9 // Bit1 pin change interrupt 0: Off
; 0000 01BA // Bit2 pin change interrupt 0: Off
; 0000 01BB // Bit3 pin change interrupt 0: Off
; 0000 01BC // Bit4 pin change interrupt 0: Off
; 0000 01BD // Bit5 pin change interrupt 0: Off
; 0000 01BE // Bit6 pin change interrupt 0: Off
; 0000 01BF // Bit7 pin change interrupt 0: Off
; 0000 01C0 PORTE.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1674,R30
; 0000 01C1 // Bit0 pin change interrupt 1: Off
; 0000 01C2 // Bit1 pin change interrupt 1: Off
; 0000 01C3 // Bit2 pin change interrupt 1: Off
; 0000 01C4 // Bit3 pin change interrupt 1: Off
; 0000 01C5 // Bit4 pin change interrupt 1: Off
; 0000 01C6 // Bit5 pin change interrupt 1: Off
; 0000 01C7 // Bit6 pin change interrupt 1: Off
; 0000 01C8 // Bit7 pin change interrupt 1: Off
; 0000 01C9 PORTE.INT1MASK=0x00;
	STS  1675,R30
; 0000 01CA 
; 0000 01CB // PORTF initialization
; 0000 01CC // OUT register
; 0000 01CD PORTF.OUT=0x00;
	STS  1700,R30
; 0000 01CE // Bit0: Input
; 0000 01CF // Bit1: Input
; 0000 01D0 // Bit2: Input
; 0000 01D1 // Bit3: Input
; 0000 01D2 // Bit4: Input
; 0000 01D3 // Bit5: Input
; 0000 01D4 // Bit6: Input
; 0000 01D5 // Bit7: Input
; 0000 01D6 PORTF.DIR=0x00;
	STS  1696,R30
; 0000 01D7 // Bit0 Output/Pull configuration: Totempole/No
; 0000 01D8 // Bit0 Input/Sense configuration: Sense both edges
; 0000 01D9 // Bit0 inverted: Off
; 0000 01DA // Bit0 slew rate limitation: Off
; 0000 01DB PORTF.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1712,R30
; 0000 01DC // Bit1 Output/Pull configuration: Totempole/No
; 0000 01DD // Bit1 Input/Sense configuration: Sense both edges
; 0000 01DE // Bit1 inverted: Off
; 0000 01DF // Bit1 slew rate limitation: Off
; 0000 01E0 PORTF.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1713,R30
; 0000 01E1 // Bit2 Output/Pull configuration: Totempole/No
; 0000 01E2 // Bit2 Input/Sense configuration: Sense both edges
; 0000 01E3 // Bit2 inverted: Off
; 0000 01E4 // Bit2 slew rate limitation: Off
; 0000 01E5 PORTF.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1714,R30
; 0000 01E6 // Bit3 Output/Pull configuration: Totempole/No
; 0000 01E7 // Bit3 Input/Sense configuration: Sense both edges
; 0000 01E8 // Bit3 inverted: Off
; 0000 01E9 // Bit3 slew rate limitation: Off
; 0000 01EA PORTF.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1715,R30
; 0000 01EB // Bit4 Output/Pull configuration: Totempole/No
; 0000 01EC // Bit4 Input/Sense configuration: Sense both edges
; 0000 01ED // Bit4 inverted: Off
; 0000 01EE // Bit4 slew rate limitation: Off
; 0000 01EF PORTF.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1716,R30
; 0000 01F0 // Bit5 Output/Pull configuration: Totempole/No
; 0000 01F1 // Bit5 Input/Sense configuration: Sense both edges
; 0000 01F2 // Bit5 inverted: Off
; 0000 01F3 // Bit5 slew rate limitation: Off
; 0000 01F4 PORTF.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1717,R30
; 0000 01F5 // Bit6 Output/Pull configuration: Totempole/No
; 0000 01F6 // Bit6 Input/Sense configuration: Sense both edges
; 0000 01F7 // Bit6 inverted: Off
; 0000 01F8 // Bit6 slew rate limitation: Off
; 0000 01F9 PORTF.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1718,R30
; 0000 01FA // Bit7 Output/Pull configuration: Totempole/No
; 0000 01FB // Bit7 Input/Sense configuration: Sense both edges
; 0000 01FC // Bit7 inverted: Off
; 0000 01FD // Bit7 slew rate limitation: Off
; 0000 01FE PORTF.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1719,R30
; 0000 01FF // Interrupt 0 level: Disabled
; 0000 0200 // Interrupt 1 level: Disabled
; 0000 0201 PORTF.INTCTRL=(PORTF.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0202 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1705
	ANDI R30,LOW(0xF0)
	STS  1705,R30
; 0000 0203 // Bit0 pin change interrupt 0: Off
; 0000 0204 // Bit1 pin change interrupt 0: Off
; 0000 0205 // Bit2 pin change interrupt 0: Off
; 0000 0206 // Bit3 pin change interrupt 0: Off
; 0000 0207 // Bit4 pin change interrupt 0: Off
; 0000 0208 // Bit5 pin change interrupt 0: Off
; 0000 0209 // Bit6 pin change interrupt 0: Off
; 0000 020A // Bit7 pin change interrupt 0: Off
; 0000 020B PORTF.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1706,R30
; 0000 020C // Bit0 pin change interrupt 1: Off
; 0000 020D // Bit1 pin change interrupt 1: Off
; 0000 020E // Bit2 pin change interrupt 1: Off
; 0000 020F // Bit3 pin change interrupt 1: Off
; 0000 0210 // Bit4 pin change interrupt 1: Off
; 0000 0211 // Bit5 pin change interrupt 1: Off
; 0000 0212 // Bit6 pin change interrupt 1: Off
; 0000 0213 // Bit7 pin change interrupt 1: Off
; 0000 0214 PORTF.INT1MASK=0x00;
	STS  1707,R30
; 0000 0215 
; 0000 0216 // PORTH initialization
; 0000 0217 // OUT register
; 0000 0218 PORTH.OUT=0x00;
	STS  1764,R30
; 0000 0219 // Bit0: Input
; 0000 021A // Bit1: Input
; 0000 021B // Bit2: Input
; 0000 021C // Bit3: Input
; 0000 021D // Bit4: Input
; 0000 021E // Bit5: Input
; 0000 021F // Bit6: Input
; 0000 0220 // Bit7: Input
; 0000 0221 PORTH.DIR=0x00;
	STS  1760,R30
; 0000 0222 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0223 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0224 // Bit0 inverted: Off
; 0000 0225 // Bit0 slew rate limitation: Off
; 0000 0226 PORTH.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1776,R30
; 0000 0227 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0228 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0229 // Bit1 inverted: Off
; 0000 022A // Bit1 slew rate limitation: Off
; 0000 022B PORTH.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1777,R30
; 0000 022C // Bit2 Output/Pull configuration: Totempole/No
; 0000 022D // Bit2 Input/Sense configuration: Sense both edges
; 0000 022E // Bit2 inverted: Off
; 0000 022F // Bit2 slew rate limitation: Off
; 0000 0230 PORTH.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1778,R30
; 0000 0231 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0232 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0233 // Bit3 inverted: Off
; 0000 0234 // Bit3 slew rate limitation: Off
; 0000 0235 PORTH.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1779,R30
; 0000 0236 // Bit4 Output/Pull configuration: Totempole/No
; 0000 0237 // Bit4 Input/Sense configuration: Sense both edges
; 0000 0238 // Bit4 inverted: Off
; 0000 0239 // Bit4 slew rate limitation: Off
; 0000 023A PORTH.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1780,R30
; 0000 023B // Bit5 Output/Pull configuration: Totempole/No
; 0000 023C // Bit5 Input/Sense configuration: Sense both edges
; 0000 023D // Bit5 inverted: Off
; 0000 023E // Bit5 slew rate limitation: Off
; 0000 023F PORTH.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1781,R30
; 0000 0240 // Bit6 Output/Pull configuration: Totempole/No
; 0000 0241 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0242 // Bit6 inverted: Off
; 0000 0243 // Bit6 slew rate limitation: Off
; 0000 0244 PORTH.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1782,R30
; 0000 0245 // Bit7 Output/Pull configuration: Totempole/No
; 0000 0246 // Bit7 Input/Sense configuration: Sense both edges
; 0000 0247 // Bit7 inverted: Off
; 0000 0248 // Bit7 slew rate limitation: Off
; 0000 0249 PORTH.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1783,R30
; 0000 024A // Interrupt 0 level: Disabled
; 0000 024B // Interrupt 1 level: Disabled
; 0000 024C PORTH.INTCTRL=(PORTH.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 024D 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1769
	ANDI R30,LOW(0xF0)
	STS  1769,R30
; 0000 024E // Bit0 pin change interrupt 0: Off
; 0000 024F // Bit1 pin change interrupt 0: Off
; 0000 0250 // Bit2 pin change interrupt 0: Off
; 0000 0251 // Bit3 pin change interrupt 0: Off
; 0000 0252 // Bit4 pin change interrupt 0: Off
; 0000 0253 // Bit5 pin change interrupt 0: Off
; 0000 0254 // Bit6 pin change interrupt 0: Off
; 0000 0255 // Bit7 pin change interrupt 0: Off
; 0000 0256 PORTH.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1770,R30
; 0000 0257 // Bit0 pin change interrupt 1: Off
; 0000 0258 // Bit1 pin change interrupt 1: Off
; 0000 0259 // Bit2 pin change interrupt 1: Off
; 0000 025A // Bit3 pin change interrupt 1: Off
; 0000 025B // Bit4 pin change interrupt 1: Off
; 0000 025C // Bit5 pin change interrupt 1: Off
; 0000 025D // Bit6 pin change interrupt 1: Off
; 0000 025E // Bit7 pin change interrupt 1: Off
; 0000 025F PORTH.INT1MASK=0x00;
	STS  1771,R30
; 0000 0260 
; 0000 0261 // PORTJ initialization
; 0000 0262 // OUT register
; 0000 0263 PORTJ.OUT=0x00;
	STS  1796,R30
; 0000 0264 // Bit0: Input
; 0000 0265 // Bit1: Input
; 0000 0266 // Bit2: Input
; 0000 0267 // Bit3: Input
; 0000 0268 // Bit4: Input
; 0000 0269 // Bit5: Input
; 0000 026A // Bit6: Input
; 0000 026B // Bit7: Input
; 0000 026C PORTJ.DIR=0x00;
	STS  1792,R30
; 0000 026D // Bit0 Output/Pull configuration: Totempole/No
; 0000 026E // Bit0 Input/Sense configuration: Sense both edges
; 0000 026F // Bit0 inverted: Off
; 0000 0270 // Bit0 slew rate limitation: Off
; 0000 0271 PORTJ.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1808,R30
; 0000 0272 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0273 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0274 // Bit1 inverted: Off
; 0000 0275 // Bit1 slew rate limitation: Off
; 0000 0276 PORTJ.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1809,R30
; 0000 0277 // Bit2 Output/Pull configuration: Totempole/No
; 0000 0278 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0279 // Bit2 inverted: Off
; 0000 027A // Bit2 slew rate limitation: Off
; 0000 027B PORTJ.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1810,R30
; 0000 027C // Bit3 Output/Pull configuration: Totempole/No
; 0000 027D // Bit3 Input/Sense configuration: Sense both edges
; 0000 027E // Bit3 inverted: Off
; 0000 027F // Bit3 slew rate limitation: Off
; 0000 0280 PORTJ.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1811,R30
; 0000 0281 // Bit4 Output/Pull configuration: Totempole/No
; 0000 0282 // Bit4 Input/Sense configuration: Sense both edges
; 0000 0283 // Bit4 inverted: Off
; 0000 0284 // Bit4 slew rate limitation: Off
; 0000 0285 PORTJ.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1812,R30
; 0000 0286 // Bit5 Output/Pull configuration: Totempole/No
; 0000 0287 // Bit5 Input/Sense configuration: Sense both edges
; 0000 0288 // Bit5 inverted: Off
; 0000 0289 // Bit5 slew rate limitation: Off
; 0000 028A PORTJ.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1813,R30
; 0000 028B // Bit6 Output/Pull configuration: Totempole/No
; 0000 028C // Bit6 Input/Sense configuration: Sense both edges
; 0000 028D // Bit6 inverted: Off
; 0000 028E // Bit6 slew rate limitation: Off
; 0000 028F PORTJ.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1814,R30
; 0000 0290 // Bit7 Output/Pull configuration: Totempole/No
; 0000 0291 // Bit7 Input/Sense configuration: Sense both edges
; 0000 0292 // Bit7 inverted: Off
; 0000 0293 // Bit7 slew rate limitation: Off
; 0000 0294 PORTJ.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1815,R30
; 0000 0295 // Interrupt 0 level: Disabled
; 0000 0296 // Interrupt 1 level: Disabled
; 0000 0297 PORTJ.INTCTRL=(PORTJ.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0298 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1801
	ANDI R30,LOW(0xF0)
	STS  1801,R30
; 0000 0299 // Bit0 pin change interrupt 0: Off
; 0000 029A // Bit1 pin change interrupt 0: Off
; 0000 029B // Bit2 pin change interrupt 0: Off
; 0000 029C // Bit3 pin change interrupt 0: Off
; 0000 029D // Bit4 pin change interrupt 0: Off
; 0000 029E // Bit5 pin change interrupt 0: Off
; 0000 029F // Bit6 pin change interrupt 0: Off
; 0000 02A0 // Bit7 pin change interrupt 0: Off
; 0000 02A1 PORTJ.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1802,R30
; 0000 02A2 // Bit0 pin change interrupt 1: Off
; 0000 02A3 // Bit1 pin change interrupt 1: Off
; 0000 02A4 // Bit2 pin change interrupt 1: Off
; 0000 02A5 // Bit3 pin change interrupt 1: Off
; 0000 02A6 // Bit4 pin change interrupt 1: Off
; 0000 02A7 // Bit5 pin change interrupt 1: Off
; 0000 02A8 // Bit6 pin change interrupt 1: Off
; 0000 02A9 // Bit7 pin change interrupt 1: Off
; 0000 02AA PORTJ.INT1MASK=0x00;
	STS  1803,R30
; 0000 02AB 
; 0000 02AC // PORTK initialization
; 0000 02AD // OUT register
; 0000 02AE PORTK.OUT=0x00;
	STS  1828,R30
; 0000 02AF // Bit0: Input
; 0000 02B0 // Bit1: Input
; 0000 02B1 // Bit2: Input
; 0000 02B2 // Bit3: Input
; 0000 02B3 // Bit4: Input
; 0000 02B4 // Bit5: Input
; 0000 02B5 // Bit6: Input
; 0000 02B6 // Bit7: Input
; 0000 02B7 PORTK.DIR=0x00;
	STS  1824,R30
; 0000 02B8 // Bit0 Output/Pull configuration: Totempole/No
; 0000 02B9 // Bit0 Input/Sense configuration: Sense both edges
; 0000 02BA // Bit0 inverted: Off
; 0000 02BB // Bit0 slew rate limitation: Off
; 0000 02BC PORTK.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1840,R30
; 0000 02BD // Bit1 Output/Pull configuration: Totempole/No
; 0000 02BE // Bit1 Input/Sense configuration: Sense both edges
; 0000 02BF // Bit1 inverted: Off
; 0000 02C0 // Bit1 slew rate limitation: Off
; 0000 02C1 PORTK.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1841,R30
; 0000 02C2 // Bit2 Output/Pull configuration: Totempole/No
; 0000 02C3 // Bit2 Input/Sense configuration: Sense both edges
; 0000 02C4 // Bit2 inverted: Off
; 0000 02C5 // Bit2 slew rate limitation: Off
; 0000 02C6 PORTK.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1842,R30
; 0000 02C7 // Bit3 Output/Pull configuration: Totempole/No
; 0000 02C8 // Bit3 Input/Sense configuration: Sense both edges
; 0000 02C9 // Bit3 inverted: Off
; 0000 02CA // Bit3 slew rate limitation: Off
; 0000 02CB PORTK.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1843,R30
; 0000 02CC // Bit4 Output/Pull configuration: Totempole/No
; 0000 02CD // Bit4 Input/Sense configuration: Sense both edges
; 0000 02CE // Bit4 inverted: Off
; 0000 02CF // Bit4 slew rate limitation: Off
; 0000 02D0 PORTK.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1844,R30
; 0000 02D1 // Bit5 Output/Pull configuration: Totempole/No
; 0000 02D2 // Bit5 Input/Sense configuration: Sense both edges
; 0000 02D3 // Bit5 inverted: Off
; 0000 02D4 // Bit5 slew rate limitation: Off
; 0000 02D5 PORTK.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1845,R30
; 0000 02D6 // Bit6 Output/Pull configuration: Totempole/No
; 0000 02D7 // Bit6 Input/Sense configuration: Sense both edges
; 0000 02D8 // Bit6 inverted: Off
; 0000 02D9 // Bit6 slew rate limitation: Off
; 0000 02DA PORTK.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1846,R30
; 0000 02DB // Bit7 Output/Pull configuration: Totempole/No
; 0000 02DC // Bit7 Input/Sense configuration: Sense both edges
; 0000 02DD // Bit7 inverted: Off
; 0000 02DE // Bit7 slew rate limitation: Off
; 0000 02DF PORTK.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1847,R30
; 0000 02E0 // Interrupt 0 level: Disabled
; 0000 02E1 // Interrupt 1 level: Disabled
; 0000 02E2 PORTK.INTCTRL=(PORTK.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 02E3 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1833
	ANDI R30,LOW(0xF0)
	STS  1833,R30
; 0000 02E4 // Bit0 pin change interrupt 0: Off
; 0000 02E5 // Bit1 pin change interrupt 0: Off
; 0000 02E6 // Bit2 pin change interrupt 0: Off
; 0000 02E7 // Bit3 pin change interrupt 0: Off
; 0000 02E8 // Bit4 pin change interrupt 0: Off
; 0000 02E9 // Bit5 pin change interrupt 0: Off
; 0000 02EA // Bit6 pin change interrupt 0: Off
; 0000 02EB // Bit7 pin change interrupt 0: Off
; 0000 02EC PORTK.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1834,R30
; 0000 02ED // Bit0 pin change interrupt 1: Off
; 0000 02EE // Bit1 pin change interrupt 1: Off
; 0000 02EF // Bit2 pin change interrupt 1: Off
; 0000 02F0 // Bit3 pin change interrupt 1: Off
; 0000 02F1 // Bit4 pin change interrupt 1: Off
; 0000 02F2 // Bit5 pin change interrupt 1: Off
; 0000 02F3 // Bit6 pin change interrupt 1: Off
; 0000 02F4 // Bit7 pin change interrupt 1: Off
; 0000 02F5 PORTK.INT1MASK=0x00;
	STS  1835,R30
; 0000 02F6 
; 0000 02F7 // PORTQ initialization
; 0000 02F8 // OUT register
; 0000 02F9 PORTQ.OUT=0x00;
	STS  1988,R30
; 0000 02FA // Bit0: Input
; 0000 02FB // Bit1: Input
; 0000 02FC // Bit2: Input
; 0000 02FD // Bit3: Input
; 0000 02FE PORTQ.DIR=0x00;
	STS  1984,R30
; 0000 02FF // Bit0 Output/Pull configuration: Totempole/No
; 0000 0300 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0301 // Bit0 inverted: Off
; 0000 0302 // Bit0 slew rate limitation: Off
; 0000 0303 PORTQ.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2000,R30
; 0000 0304 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0305 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0306 // Bit1 inverted: Off
; 0000 0307 // Bit1 slew rate limitation: Off
; 0000 0308 PORTQ.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2001,R30
; 0000 0309 // Bit2 Output/Pull configuration: Totempole/No
; 0000 030A // Bit2 Input/Sense configuration: Sense both edges
; 0000 030B // Bit2 inverted: Off
; 0000 030C // Bit2 slew rate limitation: Off
; 0000 030D PORTQ.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2002,R30
; 0000 030E // Bit3 Output/Pull configuration: Totempole/No
; 0000 030F // Bit3 Input/Sense configuration: Sense both edges
; 0000 0310 // Bit3 inverted: Off
; 0000 0311 // Bit3 slew rate limitation: Off
; 0000 0312 PORTQ.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2003,R30
; 0000 0313 // Interrupt 0 level: Disabled
; 0000 0314 // Interrupt 1 level: Disabled
; 0000 0315 PORTQ.INTCTRL=(PORTQ.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0316 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1993
	ANDI R30,LOW(0xF0)
	STS  1993,R30
; 0000 0317 // Bit0 pin change interrupt 0: Off
; 0000 0318 // Bit1 pin change interrupt 0: Off
; 0000 0319 // Bit2 pin change interrupt 0: Off
; 0000 031A // Bit3 pin change interrupt 0: Off
; 0000 031B PORTQ.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1994,R30
; 0000 031C // Bit0 pin change interrupt 1: Off
; 0000 031D // Bit1 pin change interrupt 1: Off
; 0000 031E // Bit2 pin change interrupt 1: Off
; 0000 031F // Bit3 pin change interrupt 1: Off
; 0000 0320 PORTQ.INT1MASK=0x00;
	STS  1995,R30
; 0000 0321 
; 0000 0322 // PORTR initialization
; 0000 0323 // OUT register
; 0000 0324 PORTR.OUT=0x00;
	STS  2020,R30
; 0000 0325 // Bit0: Input
; 0000 0326 // Bit1: Input
; 0000 0327 PORTR.DIR=0x00;
	STS  2016,R30
; 0000 0328 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0329 // Bit0 Input/Sense configuration: Sense both edges
; 0000 032A // Bit0 inverted: Off
; 0000 032B // Bit0 slew rate limitation: Off
; 0000 032C PORTR.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2032,R30
; 0000 032D // Bit1 Output/Pull configuration: Totempole/No
; 0000 032E // Bit1 Input/Sense configuration: Sense both edges
; 0000 032F // Bit1 inverted: Off
; 0000 0330 // Bit1 slew rate limitation: Off
; 0000 0331 PORTR.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2033,R30
; 0000 0332 // Interrupt 0 level: Disabled
; 0000 0333 // Interrupt 1 level: Disabled
; 0000 0334 PORTR.INTCTRL=(PORTR.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0335 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,2025
	ANDI R30,LOW(0xF0)
	STS  2025,R30
; 0000 0336 // Bit0 pin change interrupt 0: Off
; 0000 0337 // Bit1 pin change interrupt 0: Off
; 0000 0338 PORTR.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  2026,R30
; 0000 0339 // Bit0 pin change interrupt 1: Off
; 0000 033A // Bit1 pin change interrupt 1: Off
; 0000 033B PORTR.INT1MASK=0x00;
	STS  2027,R30
; 0000 033C }
	RET
;
;// Virtual Ports initialization
;void vports_init(void)
; 0000 0340 {
_vports_init:
; 0000 0341 // PORTA mapped to VPORT0
; 0000 0342 // PORTB mapped to VPORT1
; 0000 0343 PORTCFG.VPCTRLA=PORTCFG_VP1MAP_PORTB_gc | PORTCFG_VP0MAP_PORTA_gc;
	LDI  R30,LOW(16)
	STS  178,R30
; 0000 0344 // PORTC mapped to VPORT2
; 0000 0345 // PORTD mapped to VPORT3
; 0000 0346 PORTCFG.VPCTRLB=PORTCFG_VP3MAP_PORTD_gc | PORTCFG_VP2MAP_PORTC_gc;
	LDI  R30,LOW(50)
	STS  179,R30
; 0000 0347 }
	RET
;
;void main(void)
; 0000 034A {
_main:
; 0000 034B // Declare your local variables here
; 0000 034C unsigned char n;
; 0000 034D 
; 0000 034E // Interrupt system initialization
; 0000 034F // Optimize for speed
; 0000 0350 #pragma optsize-
; 0000 0351 // Make sure the interrupts are disabled
; 0000 0352 #asm("cli")
;	n -> R17
	cli
; 0000 0353 // Low level interrupt: Off
; 0000 0354 // Round-robin scheduling for low level interrupt: Off
; 0000 0355 // Medium level interrupt: Off
; 0000 0356 // High level interrupt: Off
; 0000 0357 // The interrupt vectors will be placed at the start of the Application FLASH section
; 0000 0358 n=(PMIC.CTRL & (~(PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm)));
	LDS  R30,162
	ANDI R30,LOW(0x38)
	MOV  R17,R30
; 0000 0359 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 035A PMIC.CTRL=n;
	STS  162,R17
; 0000 035B // Set the default priority for round-robin scheduling
; 0000 035C PMIC.INTPRI=0x00;
	LDI  R30,LOW(0)
	STS  161,R30
; 0000 035D // Restore optimization for size if needed
; 0000 035E #pragma optsize_default
; 0000 035F 
; 0000 0360 // System clocks initialization
; 0000 0361 system_clocks_init();
	RCALL _system_clocks_init
; 0000 0362 
; 0000 0363 // Ports initialization
; 0000 0364 ports_init();
	RCALL _ports_init
; 0000 0365 
; 0000 0366 // Virtual Ports initialization
; 0000 0367 vports_init();
	RCALL _vports_init
; 0000 0368 
; 0000 0369 // Alphanumeric LCD initialization
; 0000 036A // Connections specified in the
; 0000 036B // Project|Configure|C Compiler|Libraries|Alphanumeric LCD menu:
; 0000 036C // RS - PORTA Bit 0
; 0000 036D // RD - PORTA Bit 1
; 0000 036E // EN - PORTA Bit 2
; 0000 036F // D4 - PORTA Bit 4
; 0000 0370 // D5 - PORTA Bit 5
; 0000 0371 // D6 - PORTA Bit 6
; 0000 0372 // D7 - PORTA Bit 7
; 0000 0373 // Characters/line: 16
; 0000 0374 lcd_init(16);
	LDI  R30,LOW(16)
	ST   -Y,R30
	RCALL _lcd_init
; 0000 0375 
; 0000 0376 while (1)
_0x6:
; 0000 0377       {
; 0000 0378       lcd_gotoxy(0,0);
	LDI  R30,LOW(0)
	ST   -Y,R30
	ST   -Y,R30
	RCALL _lcd_gotoxy
; 0000 0379       lcd_putsf("You are welcome");
	__POINTW1FN _0x0,0
	ST   -Y,R31
	ST   -Y,R30
	RCALL _lcd_putsf
; 0000 037A 
; 0000 037B       }
	RJMP _0x6
; 0000 037C }
_0x9:
	RJMP _0x9

	.DSEG

	.CSEG
__lcd_write_nibble_G100:
	LD   R30,Y
	ANDI R30,LOW(0x10)
	BREQ _0x2000004
	LDI  R30,LOW(16)
	STS  1541,R30
	RJMP _0x2000005
_0x2000004:
	LDI  R30,LOW(16)
	STS  1542,R30
_0x2000005:
	LD   R30,Y
	ANDI R30,LOW(0x20)
	BREQ _0x2000006
	LDI  R30,LOW(32)
	STS  1541,R30
	RJMP _0x2000007
_0x2000006:
	LDI  R30,LOW(32)
	STS  1542,R30
_0x2000007:
	LD   R30,Y
	ANDI R30,LOW(0x40)
	BREQ _0x2000008
	LDI  R30,LOW(64)
	STS  1541,R30
	RJMP _0x2000009
_0x2000008:
	LDI  R30,LOW(64)
	STS  1542,R30
_0x2000009:
	LD   R30,Y
	ANDI R30,LOW(0x80)
	BREQ _0x200000A
	LDI  R30,LOW(128)
	STS  1541,R30
	RJMP _0x200000B
_0x200000A:
	LDI  R30,LOW(128)
	STS  1542,R30
_0x200000B:
	__DELAY_USB 1
	LDI  R30,LOW(4)
	STS  1541,R30
	__DELAY_USB 3
	STS  1542,R30
	__DELAY_USB 3
	RJMP _0x2020001
__lcd_write_data:
	LD   R30,Y
	ST   -Y,R30
	RCALL __lcd_write_nibble_G100
    ld    r30,y
    swap  r30
    st    y,r30
	LD   R30,Y
	ST   -Y,R30
	RCALL __lcd_write_nibble_G100
	__DELAY_USB 33
	RJMP _0x2020001
_lcd_gotoxy:
	LD   R30,Y
	LDI  R31,0
	SUBI R30,LOW(-__base_y_G100)
	SBCI R31,HIGH(-__base_y_G100)
	LD   R30,Z
	LDD  R26,Y+1
	ADD  R30,R26
	ST   -Y,R30
	RCALL __lcd_write_data
	LDD  R3,Y+1
	LDD  R2,Y+0
	ADIW R28,2
	RET
_lcd_clear:
	LDI  R30,LOW(2)
	RCALL SUBOPT_0x0
	LDI  R30,LOW(12)
	ST   -Y,R30
	RCALL __lcd_write_data
	LDI  R30,LOW(1)
	RCALL SUBOPT_0x0
	LDI  R30,LOW(0)
	MOV  R2,R30
	MOV  R3,R30
	RET
_lcd_putchar:
	LD   R26,Y
	CPI  R26,LOW(0xA)
	BREQ _0x2000011
	CP   R3,R5
	BRLO _0x2000010
_0x2000011:
	LDI  R30,LOW(0)
	ST   -Y,R30
	INC  R2
	ST   -Y,R2
	RCALL _lcd_gotoxy
	LD   R26,Y
	CPI  R26,LOW(0xA)
	BRNE _0x2000013
	RJMP _0x2020001
_0x2000013:
_0x2000010:
	INC  R3
	LDI  R30,LOW(1)
	STS  1541,R30
	LD   R30,Y
	ST   -Y,R30
	RCALL __lcd_write_data
	LDI  R30,LOW(1)
	STS  1542,R30
	RJMP _0x2020001
_lcd_putsf:
	ST   -Y,R17
_0x2000017:
	LDD  R30,Y+1
	LDD  R31,Y+1+1
	ADIW R30,1
	STD  Y+1,R30
	STD  Y+1+1,R31
	SBIW R30,1
	LPM  R30,Z
	MOV  R17,R30
	CPI  R30,0
	BREQ _0x2000019
	ST   -Y,R17
	RCALL _lcd_putchar
	RJMP _0x2000017
_0x2000019:
	LDD  R17,Y+0
	ADIW R28,3
	RET
_lcd_init:
	LDI  R30,LOW(16)
	STS  1537,R30
	LDI  R30,LOW(32)
	STS  1537,R30
	LDI  R30,LOW(64)
	STS  1537,R30
	LDI  R30,LOW(128)
	STS  1537,R30
	LDI  R30,LOW(4)
	STS  1537,R30
	LDI  R30,LOW(1)
	STS  1537,R30
	LDI  R30,LOW(2)
	STS  1537,R30
	LDI  R30,LOW(4)
	STS  1542,R30
	LDI  R30,LOW(1)
	STS  1542,R30
	LDI  R30,LOW(2)
	STS  1542,R30
	LDD  R5,Y+0
	LD   R30,Y
	SUBI R30,-LOW(128)
	__PUTB1MN __base_y_G100,2
	LD   R30,Y
	SUBI R30,-LOW(192)
	__PUTB1MN __base_y_G100,3
	LDI  R30,LOW(20)
	LDI  R31,HIGH(20)
	ST   -Y,R31
	ST   -Y,R30
	CALL _delay_ms
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	LDI  R30,LOW(32)
	ST   -Y,R30
	RCALL __lcd_write_nibble_G100
	__DELAY_USB 67
	LDI  R30,LOW(40)
	ST   -Y,R30
	RCALL __lcd_write_data
	LDI  R30,LOW(4)
	ST   -Y,R30
	RCALL __lcd_write_data
	LDI  R30,LOW(133)
	ST   -Y,R30
	RCALL __lcd_write_data
	LDI  R30,LOW(6)
	ST   -Y,R30
	RCALL __lcd_write_data
	RCALL _lcd_clear
_0x2020001:
	ADIW R28,1
	RET

	.DSEG
__base_y_G100:
	.BYTE 0x4

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x0:
	ST   -Y,R30
	RCALL __lcd_write_data
	LDI  R30,LOW(3)
	LDI  R31,HIGH(3)
	ST   -Y,R31
	ST   -Y,R30
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x1:
	LDI  R30,LOW(48)
	ST   -Y,R30
	RCALL __lcd_write_nibble_G100
	__DELAY_USB 67
	RET


	.CSEG
_delay_ms:
	ld   r30,y+
	ld   r31,y+
	adiw r30,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x1F4
	wdr
	sbiw r30,1
	brne __delay_ms0
__delay_ms1:
	ret

;END OF CODE MARKER
__END_OF_CODE:
