opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F877
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 11 "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 11 "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFFF & 0xFFFF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_InitLCD
	FNCALL	_main,_Init1msecTimerInterrupt
	FNCALL	_main,_DisplayTimeToLCD
	FNCALL	_main,_UpdateTimeCounters
	FNCALL	_DisplayTimeToLCD,_ClearLCDScreen
	FNCALL	_DisplayTimeToLCD,___lwdiv
	FNCALL	_DisplayTimeToLCD,_WriteDataToLCD
	FNCALL	_DisplayTimeToLCD,___lwmod
	FNCALL	_ClearLCDScreen,_WriteCommandToLCD
	FNCALL	_InitLCD,_ToggleEpinOfLCD
	FNCALL	_InitLCD,_WriteCommandToLCD
	FNCALL	_WriteDataToLCD,_ToggleEpinOfLCD
	FNCALL	_WriteCommandToLCD,_ToggleEpinOfLCD
	FNCALL	_Init1msecTimerInterrupt,_InitTimer0
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_hrCounter
	global	_minCounter
	global	_msCounter
	global	_secCounter
	global	_PORTB
psect	text273,local,class=CODE,delta=2
global __ptext273
__ptext273:
_PORTB	set	6
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB7
_TRISB7	set	1079
	file	"Clock.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_hrCounter:
       ds      2

_minCounter:
       ds      2

_msCounter:
       ds      2

_secCounter:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Init1msecTimerInterrupt
?_Init1msecTimerInterrupt:	; 0 bytes @ 0x0
	global	?_UpdateTimeCounters
?_UpdateTimeCounters:	; 0 bytes @ 0x0
	global	?_ToggleEpinOfLCD
?_ToggleEpinOfLCD:	; 0 bytes @ 0x0
	global	?_WriteCommandToLCD
?_WriteCommandToLCD:	; 0 bytes @ 0x0
	global	?_WriteDataToLCD
?_WriteDataToLCD:	; 0 bytes @ 0x0
	global	?_InitLCD
?_InitLCD:	; 0 bytes @ 0x0
	global	?_ClearLCDScreen
?_ClearLCDScreen:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_InitTimer0
?_InitTimer0:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	ds	2
	global	??_Init1msecTimerInterrupt
??_Init1msecTimerInterrupt:	; 0 bytes @ 0x2
	global	??_UpdateTimeCounters
??_UpdateTimeCounters:	; 0 bytes @ 0x2
	global	??_ToggleEpinOfLCD
??_ToggleEpinOfLCD:	; 0 bytes @ 0x2
	global	??_InitTimer0
??_InitTimer0:	; 0 bytes @ 0x2
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x2
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x2
	ds	1
	global	??_WriteCommandToLCD
??_WriteCommandToLCD:	; 0 bytes @ 0x3
	global	??_WriteDataToLCD
??_WriteDataToLCD:	; 0 bytes @ 0x3
	global	WriteCommandToLCD@Command
WriteCommandToLCD@Command:	; 1 bytes @ 0x3
	global	WriteDataToLCD@LCDChar
WriteDataToLCD@LCDChar:	; 1 bytes @ 0x3
	ds	1
	global	??_InitLCD
??_InitLCD:	; 0 bytes @ 0x4
	global	??_ClearLCDScreen
??_ClearLCDScreen:	; 0 bytes @ 0x4
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x4
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x4
	ds	2
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x6
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x6
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x6
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x6
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x8
	ds	1
	global	??_DisplayTimeToLCD
??_DisplayTimeToLCD:	; 0 bytes @ 0x9
	global	??_main
??_main:	; 0 bytes @ 0x9
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_DisplayTimeToLCD
?_DisplayTimeToLCD:	; 0 bytes @ 0x0
	global	DisplayTimeToLCD@h
DisplayTimeToLCD@h:	; 2 bytes @ 0x0
	ds	2
	global	DisplayTimeToLCD@m
DisplayTimeToLCD@m:	; 2 bytes @ 0x2
	ds	2
	global	DisplayTimeToLCD@s
DisplayTimeToLCD@s:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      6      14
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _DisplayTimeToLCD->___lwdiv
;;   _ClearLCDScreen->_WriteCommandToLCD
;;   _InitLCD->_WriteCommandToLCD
;;   _WriteDataToLCD->_ToggleEpinOfLCD
;;   _WriteCommandToLCD->_ToggleEpinOfLCD
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_DisplayTimeToLCD
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     585
;;                            _InitLCD
;;            _Init1msecTimerInterrupt
;;                   _DisplayTimeToLCD
;;                 _UpdateTimeCounters
;; ---------------------------------------------------------------------------------
;; (1) _DisplayTimeToLCD                                     6     0      6     541
;;                                              0 BANK0      6     0      6
;;                     _ClearLCDScreen
;;                            ___lwdiv
;;                     _WriteDataToLCD
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (2) _ClearLCDScreen                                       2     2      0      44
;;                                              4 COMMON     2     2      0
;;                  _WriteCommandToLCD
;; ---------------------------------------------------------------------------------
;; (1) _InitLCD                                              2     2      0      44
;;                                              4 COMMON     2     2      0
;;                    _ToggleEpinOfLCD
;;                  _WriteCommandToLCD
;; ---------------------------------------------------------------------------------
;; (2) _WriteDataToLCD                                       1     1      0      44
;;                                              3 COMMON     1     1      0
;;                    _ToggleEpinOfLCD
;; ---------------------------------------------------------------------------------
;; (3) _WriteCommandToLCD                                    1     1      0      44
;;                                              3 COMMON     1     1      0
;;                    _ToggleEpinOfLCD
;; ---------------------------------------------------------------------------------
;; (1) _Init1msecTimerInterrupt                              0     0      0       0
;;                         _InitTimer0
;; ---------------------------------------------------------------------------------
;; (3) _ToggleEpinOfLCD                                      1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              5     1      4     159
;;                                              2 COMMON     5     1      4
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              7     3      4     162
;;                                              2 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) _InitTimer0                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _UpdateTimeCounters                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _InitLCD
;;     _ToggleEpinOfLCD
;;     _WriteCommandToLCD
;;       _ToggleEpinOfLCD
;;   _Init1msecTimerInterrupt
;;     _InitTimer0
;;   _DisplayTimeToLCD
;;     _ClearLCDScreen
;;       _WriteCommandToLCD
;;         _ToggleEpinOfLCD
;;     ___lwdiv
;;     _WriteDataToLCD
;;       _ToggleEpinOfLCD
;;     ___lwmod
;;   _UpdateTimeCounters
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      17       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      6       E       5       17.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      1B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 16 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_InitLCD
;;		_Init1msecTimerInterrupt
;;		_DisplayTimeToLCD
;;		_UpdateTimeCounters
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Main.c"
	line	16
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	17
	
l4057:	
;Main.c: 17: InitLCD();
	fcall	_InitLCD
	line	18
;Main.c: 18: Init1msecTimerInterrupt();
	fcall	_Init1msecTimerInterrupt
	line	22
	
l4059:	
;Main.c: 21: {
;Main.c: 22: if( msCounter == 0 )
	bcf	status, 5	;RP0=0, select bank0
	movf	((_msCounter+1)),w
	iorwf	((_msCounter)),w
	skipz
	goto	u281
	goto	u280
u281:
	goto	l1322
u280:
	line	25
	
l4061:	
;Main.c: 23: {
;Main.c: 25: DisplayTimeToLCD(hrCounter, minCounter, secCounter);
	movf	(_hrCounter+1),w
	movwf	(?_DisplayTimeToLCD+1)
	movf	(_hrCounter),w
	movwf	(?_DisplayTimeToLCD)
	movf	(_minCounter+1),w
	movwf	1+(?_DisplayTimeToLCD)+02h
	movf	(_minCounter),w
	movwf	0+(?_DisplayTimeToLCD)+02h
	movf	(_secCounter+1),w
	movwf	1+(?_DisplayTimeToLCD)+04h
	movf	(_secCounter),w
	movwf	0+(?_DisplayTimeToLCD)+04h
	fcall	_DisplayTimeToLCD
	line	26
	
l1322:	
	line	28
;Main.c: 26: }
;Main.c: 28: UpdateTimeCounters();
	fcall	_UpdateTimeCounters
	goto	l4059
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	30
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DisplayTimeToLCD
psect	text274,local,class=CODE,delta=2
global __ptext274
__ptext274:

;; *************** function _DisplayTimeToLCD *****************
;; Defined at:
;;		line 107 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;  h               2    0[BANK0 ] unsigned int 
;;  m               2    2[BANK0 ] unsigned int 
;;  s               2    4[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ClearLCDScreen
;;		___lwdiv
;;		_WriteDataToLCD
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text274
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
	line	107
	global	__size_of_DisplayTimeToLCD
	__size_of_DisplayTimeToLCD	equ	__end_of_DisplayTimeToLCD-_DisplayTimeToLCD
	
_DisplayTimeToLCD:	
	opt	stack 3
; Regs used in _DisplayTimeToLCD: [wreg+status,2+status,0+pclath+cstack]
	line	108
	
l4055:	
;LCD.c: 108: ClearLCDScreen();
	fcall	_ClearLCDScreen
	line	111
;LCD.c: 111: WriteDataToLCD( (h/10)+0x30 );
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayTimeToLCD@h+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(DisplayTimeToLCD@h),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_WriteDataToLCD
	line	112
;LCD.c: 112: WriteDataToLCD( (h%10)+0x30 );
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayTimeToLCD@h+1),w
	movwf	1+(?___lwmod)+02h
	movf	(DisplayTimeToLCD@h),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_WriteDataToLCD
	line	115
;LCD.c: 115: WriteDataToLCD(':');
	movlw	(03Ah)
	fcall	_WriteDataToLCD
	line	118
;LCD.c: 118: WriteDataToLCD( (m/10)+0x30 );
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayTimeToLCD@m+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(DisplayTimeToLCD@m),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_WriteDataToLCD
	line	119
;LCD.c: 119: WriteDataToLCD( (m%10)+0x30 );
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayTimeToLCD@m+1),w
	movwf	1+(?___lwmod)+02h
	movf	(DisplayTimeToLCD@m),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_WriteDataToLCD
	line	122
;LCD.c: 122: WriteDataToLCD(':');
	movlw	(03Ah)
	fcall	_WriteDataToLCD
	line	125
;LCD.c: 125: WriteDataToLCD( (s/10)+0x30 );
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayTimeToLCD@s+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(DisplayTimeToLCD@s),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_WriteDataToLCD
	line	126
;LCD.c: 126: WriteDataToLCD( (s%10)+0x30 );
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayTimeToLCD@s+1),w
	movwf	1+(?___lwmod)+02h
	movf	(DisplayTimeToLCD@s),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_WriteDataToLCD
	line	127
	
l664:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayTimeToLCD
	__end_of_DisplayTimeToLCD:
;; =============== function _DisplayTimeToLCD ends ============

	signat	_DisplayTimeToLCD,12408
	global	_ClearLCDScreen
psect	text275,local,class=CODE,delta=2
global __ptext275
__ptext275:

;; *************** function _ClearLCDScreen *****************
;; Defined at:
;;		line 99 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_WriteCommandToLCD
;; This function is called by:
;;		_DisplayTimeToLCD
;; This function uses a non-reentrant model
;;
psect	text275
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
	line	99
	global	__size_of_ClearLCDScreen
	__size_of_ClearLCDScreen	equ	__end_of_ClearLCDScreen-_ClearLCDScreen
	
_ClearLCDScreen:	
	opt	stack 3
; Regs used in _ClearLCDScreen: [wreg+status,2+status,0+pclath+cstack]
	line	100
	
l4051:	
;LCD.c: 100: WriteCommandToLCD(0x01);
	movlw	(01h)
	fcall	_WriteCommandToLCD
	line	101
	
l4053:	
;LCD.c: 101: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_ClearLCDScreen+0)+0+1),f
	movlw	151
movwf	((??_ClearLCDScreen+0)+0),f
u297:
	decfsz	((??_ClearLCDScreen+0)+0),f
	goto	u297
	decfsz	((??_ClearLCDScreen+0)+0+1),f
	goto	u297
	nop2
opt asmopt_on

	line	102
	
l661:	
	return
	opt stack 0
GLOBAL	__end_of_ClearLCDScreen
	__end_of_ClearLCDScreen:
;; =============== function _ClearLCDScreen ends ============

	signat	_ClearLCDScreen,88
	global	_InitLCD
psect	text276,local,class=CODE,delta=2
global __ptext276
__ptext276:

;; *************** function _InitLCD *****************
;; Defined at:
;;		line 42 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ToggleEpinOfLCD
;;		_WriteCommandToLCD
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text276
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
	line	42
	global	__size_of_InitLCD
	__size_of_InitLCD	equ	__end_of_InitLCD-_InitLCD
	
_InitLCD:	
	opt	stack 4
; Regs used in _InitLCD: [wreg+status,2+status,0+pclath+cstack]
	line	44
	
l4011:	
;LCD.c: 44: RB0 = 0;
	bcf	(48/8),(48)&7
	line	45
;LCD.c: 45: RB1 = 0;
	bcf	(49/8),(49)&7
	line	46
;LCD.c: 46: RB4 = 0;
	bcf	(52/8),(52)&7
	line	47
;LCD.c: 47: RB5 = 0;
	bcf	(53/8),(53)&7
	line	48
;LCD.c: 48: RB6 = 0;
	bcf	(54/8),(54)&7
	line	49
;LCD.c: 49: RB7 = 0;
	bcf	(55/8),(55)&7
	line	50
;LCD.c: 50: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	51
;LCD.c: 51: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	52
;LCD.c: 52: TRISB4 = 0;
	bcf	(1076/8)^080h,(1076)&7
	line	53
;LCD.c: 53: TRISB5 = 0;
	bcf	(1077/8)^080h,(1077)&7
	line	54
;LCD.c: 54: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	55
;LCD.c: 55: TRISB7 = 0;
	bcf	(1079/8)^080h,(1079)&7
	line	58
	
l4013:	
;LCD.c: 58: _delay((unsigned long)((40)*(4000000/4000.0)));
	opt asmopt_off
movlw	52
movwf	((??_InitLCD+0)+0+1),f
	movlw	241
movwf	((??_InitLCD+0)+0),f
u307:
	decfsz	((??_InitLCD+0)+0),f
	goto	u307
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u307
	nop2
opt asmopt_on

	line	60
	
l4015:	
;LCD.c: 60: PORTB &= 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	61
	
l4017:	
;LCD.c: 61: PORTB |= 0x30;
	movlw	(030h)
	iorwf	(6),f	;volatile
	line	62
	
l4019:	
;LCD.c: 62: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	64
	
l4021:	
;LCD.c: 64: _delay((unsigned long)((6)*(4000000/4000.0)));
	opt asmopt_off
movlw	8
movwf	((??_InitLCD+0)+0+1),f
	movlw	201
movwf	((??_InitLCD+0)+0),f
u317:
	decfsz	((??_InitLCD+0)+0),f
	goto	u317
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u317
	nop2
opt asmopt_on

	line	66
	
l4023:	
;LCD.c: 66: PORTB &= 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	67
	
l4025:	
;LCD.c: 67: PORTB |= 0x30;
	movlw	(030h)
	iorwf	(6),f	;volatile
	line	68
;LCD.c: 68: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	70
	
l4027:	
;LCD.c: 70: _delay((unsigned long)((300)*(4000000/4000000.0)));
	opt asmopt_off
movlw	99
movwf	(??_InitLCD+0)+0,f
u327:
decfsz	(??_InitLCD+0)+0,f
	goto	u327
	nop2	;nop
opt asmopt_on

	line	72
	
l4029:	
;LCD.c: 72: PORTB &= 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	73
	
l4031:	
;LCD.c: 73: PORTB |= 0x30;
	movlw	(030h)
	iorwf	(6),f	;volatile
	line	74
	
l4033:	
;LCD.c: 74: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	76
;LCD.c: 76: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_InitLCD+0)+0+1),f
	movlw	151
movwf	((??_InitLCD+0)+0),f
u337:
	decfsz	((??_InitLCD+0)+0),f
	goto	u337
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u337
	nop2
opt asmopt_on

	line	78
	
l4035:	
;LCD.c: 78: PORTB &= 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	79
	
l4037:	
;LCD.c: 79: PORTB |= 0x20;
	bsf	(6)+(5/8),(5)&7	;volatile
	line	80
	
l4039:	
;LCD.c: 80: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	82
	
l4041:	
;LCD.c: 82: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_InitLCD+0)+0+1),f
	movlw	151
movwf	((??_InitLCD+0)+0),f
u347:
	decfsz	((??_InitLCD+0)+0),f
	goto	u347
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u347
	nop2
opt asmopt_on

	line	84
	
l4043:	
;LCD.c: 84: WriteCommandToLCD(0x28);
	movlw	(028h)
	fcall	_WriteCommandToLCD
	line	85
	
l4045:	
;LCD.c: 85: WriteCommandToLCD(0x0c);
	movlw	(0Ch)
	fcall	_WriteCommandToLCD
	line	86
	
l4047:	
;LCD.c: 86: WriteCommandToLCD(0x01);
	movlw	(01h)
	fcall	_WriteCommandToLCD
	line	87
	
l4049:	
;LCD.c: 87: WriteCommandToLCD(0x06);
	movlw	(06h)
	fcall	_WriteCommandToLCD
	line	88
	
l652:	
	return
	opt stack 0
GLOBAL	__end_of_InitLCD
	__end_of_InitLCD:
;; =============== function _InitLCD ends ============

	signat	_InitLCD,88
	global	_WriteDataToLCD
psect	text277,local,class=CODE,delta=2
global __ptext277
__ptext277:

;; *************** function _WriteDataToLCD *****************
;; Defined at:
;;		line 28 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;  LCDChar         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  LCDChar         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ToggleEpinOfLCD
;; This function is called by:
;;		_DisplayTimeToLCD
;; This function uses a non-reentrant model
;;
psect	text277
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
	line	28
	global	__size_of_WriteDataToLCD
	__size_of_WriteDataToLCD	equ	__end_of_WriteDataToLCD-_WriteDataToLCD
	
_WriteDataToLCD:	
	opt	stack 4
; Regs used in _WriteDataToLCD: [wreg+status,2+status,0+pclath+cstack]
;WriteDataToLCD@LCDChar stored from wreg
	movwf	(WriteDataToLCD@LCDChar)
	line	29
	
l3999:	
;LCD.c: 29: RB1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	31
	
l4001:	
;LCD.c: 31: PORTB &= 0x0F;
	movlw	(0Fh)
	andwf	(6),f	;volatile
	line	32
;LCD.c: 32: PORTB |= (LCDChar&0xF0);
	movf	(WriteDataToLCD@LCDChar),w
	andlw	0F0h
	iorwf	(6),f	;volatile
	line	33
	
l4003:	
;LCD.c: 33: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	35
	
l4005:	
;LCD.c: 35: PORTB &= 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	36
	
l4007:	
;LCD.c: 36: PORTB |= ((LCDChar<<4)&0xF0);
	swapf	(WriteDataToLCD@LCDChar),w
	andlw	(0ffh shl 4) & 0ffh
	andlw	0F0h
	iorwf	(6),f	;volatile
	line	37
	
l4009:	
;LCD.c: 37: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	38
	
l649:	
	return
	opt stack 0
GLOBAL	__end_of_WriteDataToLCD
	__end_of_WriteDataToLCD:
;; =============== function _WriteDataToLCD ends ============

	signat	_WriteDataToLCD,4216
	global	_WriteCommandToLCD
psect	text278,local,class=CODE,delta=2
global __ptext278
__ptext278:

;; *************** function _WriteCommandToLCD *****************
;; Defined at:
;;		line 14 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;  Command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Command         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ToggleEpinOfLCD
;; This function is called by:
;;		_InitLCD
;;		_ClearLCDScreen
;; This function uses a non-reentrant model
;;
psect	text278
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
	line	14
	global	__size_of_WriteCommandToLCD
	__size_of_WriteCommandToLCD	equ	__end_of_WriteCommandToLCD-_WriteCommandToLCD
	
_WriteCommandToLCD:	
	opt	stack 3
; Regs used in _WriteCommandToLCD: [wreg+status,2+status,0+pclath+cstack]
;WriteCommandToLCD@Command stored from wreg
	movwf	(WriteCommandToLCD@Command)
	line	15
	
l3987:	
;LCD.c: 15: RB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	line	17
	
l3989:	
;LCD.c: 17: PORTB &= 0x0F;
	movlw	(0Fh)
	andwf	(6),f	;volatile
	line	18
;LCD.c: 18: PORTB |= (Command&0xF0);
	movf	(WriteCommandToLCD@Command),w
	andlw	0F0h
	iorwf	(6),f	;volatile
	line	19
	
l3991:	
;LCD.c: 19: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	21
	
l3993:	
;LCD.c: 21: PORTB &= 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	22
	
l3995:	
;LCD.c: 22: PORTB |= ((Command<<4)&0xF0);
	swapf	(WriteCommandToLCD@Command),w
	andlw	(0ffh shl 4) & 0ffh
	andlw	0F0h
	iorwf	(6),f	;volatile
	line	23
	
l3997:	
;LCD.c: 23: ToggleEpinOfLCD();
	fcall	_ToggleEpinOfLCD
	line	24
	
l646:	
	return
	opt stack 0
GLOBAL	__end_of_WriteCommandToLCD
	__end_of_WriteCommandToLCD:
;; =============== function _WriteCommandToLCD ends ============

	signat	_WriteCommandToLCD,4216
	global	_Init1msecTimerInterrupt
psect	text279,local,class=CODE,delta=2
global __ptext279
__ptext279:

;; *************** function _Init1msecTimerInterrupt *****************
;; Defined at:
;;		line 24 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_InitTimer0
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text279
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Timer.c"
	global	__size_of_Init1msecTimerInterrupt
	__size_of_Init1msecTimerInterrupt	equ	__end_of_Init1msecTimerInterrupt-_Init1msecTimerInterrupt
	
_Init1msecTimerInterrupt:	
	opt	stack 5
; Regs used in _Init1msecTimerInterrupt: [wreg+status,2+status,0+pclath+cstack]
	line	25
	
l3985:	
;Timer.c: 25: InitTimer0();
	fcall	_InitTimer0
	line	26
	
l1977:	
	return
	opt stack 0
GLOBAL	__end_of_Init1msecTimerInterrupt
	__end_of_Init1msecTimerInterrupt:
;; =============== function _Init1msecTimerInterrupt ends ============

	signat	_Init1msecTimerInterrupt,88
	global	_ToggleEpinOfLCD
psect	text280,local,class=CODE,delta=2
global __ptext280
__ptext280:

;; *************** function _ToggleEpinOfLCD *****************
;; Defined at:
;;		line 5 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_WriteCommandToLCD
;;		_WriteDataToLCD
;;		_InitLCD
;; This function uses a non-reentrant model
;;
psect	text280
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\LCD.c"
	line	5
	global	__size_of_ToggleEpinOfLCD
	__size_of_ToggleEpinOfLCD	equ	__end_of_ToggleEpinOfLCD-_ToggleEpinOfLCD
	
_ToggleEpinOfLCD:	
	opt	stack 4
; Regs used in _ToggleEpinOfLCD: [wreg]
	line	6
	
l3979:	
;LCD.c: 6: RB0 = 1;
	bsf	(48/8),(48)&7
	line	7
	
l3981:	
;LCD.c: 7: _delay((unsigned long)((500)*(4000000/4000000.0)));
	opt asmopt_off
movlw	166
movwf	(??_ToggleEpinOfLCD+0)+0,f
u357:
decfsz	(??_ToggleEpinOfLCD+0)+0,f
	goto	u357
	clrwdt
opt asmopt_on

	line	8
	
l3983:	
;LCD.c: 8: RB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	9
;LCD.c: 9: _delay((unsigned long)((500)*(4000000/4000000.0)));
	opt asmopt_off
movlw	166
movwf	(??_ToggleEpinOfLCD+0)+0,f
u367:
decfsz	(??_ToggleEpinOfLCD+0)+0,f
	goto	u367
	clrwdt
opt asmopt_on

	line	10
	
l643:	
	return
	opt stack 0
GLOBAL	__end_of_ToggleEpinOfLCD
	__end_of_ToggleEpinOfLCD:
;; =============== function _ToggleEpinOfLCD ends ============

	signat	_ToggleEpinOfLCD,88
	global	___lwmod
psect	text281,local,class=CODE,delta=2
global __ptext281
__ptext281:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayTimeToLCD
;; This function uses a non-reentrant model
;;
psect	text281
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l3959:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u241
	goto	u240
u241:
	goto	l3975
u240:
	line	9
	
l3961:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	l3965
	line	11
	
l3963:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
l3965:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u251
	goto	u250
u251:
	goto	l3963
u250:
	line	15
	
l3967:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u265
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u265:
	skipc
	goto	u261
	goto	u260
u261:
	goto	l3971
u260:
	line	16
	
l3969:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l3971:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l3973:	
	decfsz	(___lwmod@counter),f
	goto	u271
	goto	u270
u271:
	goto	l3967
u270:
	line	20
	
l3975:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l3294:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text282,local,class=CODE,delta=2
global __ptext282
__ptext282:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] unsigned int 
;;  counter         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayTimeToLCD
;; This function uses a non-reentrant model
;;
psect	text282
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3933:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l3935:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u201
	goto	u200
u201:
	goto	l3955
u200:
	line	11
	
l3937:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l3941
	line	13
	
l3939:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l3941:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u211
	goto	u210
u211:
	goto	l3939
u210:
	line	17
	
l3943:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l3945:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u225
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u225:
	skipc
	goto	u221
	goto	u220
u221:
	goto	l3951
u220:
	line	19
	
l3947:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3949:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l3951:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l3953:	
	decfsz	(___lwdiv@counter),f
	goto	u231
	goto	u230
u231:
	goto	l3943
u230:
	line	25
	
l3955:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l3284:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_InitTimer0
psect	text283,local,class=CODE,delta=2
global __ptext283
__ptext283:

;; *************** function _InitTimer0 *****************
;; Defined at:
;;		line 14 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init1msecTimerInterrupt
;; This function uses a non-reentrant model
;;
psect	text283
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Timer.c"
	line	14
	global	__size_of_InitTimer0
	__size_of_InitTimer0	equ	__end_of_InitTimer0-_InitTimer0
	
_InitTimer0:	
	opt	stack 5
; Regs used in _InitTimer0: [wreg+status,2+status,0]
	line	16
	
l3919:	
;Timer.c: 16: OPTION_REG &= 0xC1;
	movlw	(0C1h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(129)^080h,f	;volatile
	line	18
	
l3921:	
;Timer.c: 18: T0IE = 1;
	bsf	(93/8),(93)&7
	line	19
	
l3923:	
;Timer.c: 19: GIE = 1;
	bsf	(95/8),(95)&7
	line	20
	
l1974:	
	return
	opt stack 0
GLOBAL	__end_of_InitTimer0
	__end_of_InitTimer0:
;; =============== function _InitTimer0 ends ============

	signat	_InitTimer0,88
	global	_UpdateTimeCounters
psect	text284,local,class=CODE,delta=2
global __ptext284
__ptext284:

;; *************** function _UpdateTimeCounters *****************
;; Defined at:
;;		line 32 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text284
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\Timer.c"
	line	32
	global	__size_of_UpdateTimeCounters
	__size_of_UpdateTimeCounters	equ	__end_of_UpdateTimeCounters-_UpdateTimeCounters
	
_UpdateTimeCounters:	
	opt	stack 6
; Regs used in _UpdateTimeCounters: [wreg+status,2+status,0]
	line	33
	
l3897:	
;Timer.c: 33: if (msCounter==1000)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
		movf	(_msCounter+1),w
	xorlw	3
	movlw	232
	skipnz
	xorwf	(_msCounter),w

	skipz
	goto	u151
	goto	u150
u151:
	goto	l3903
u150:
	line	35
	
l3899:	
;Timer.c: 34: {
;Timer.c: 35: secCounter++;
	incf	(_secCounter),f
	skipnz
	incf	(_secCounter+1),f
	line	36
	
l3901:	
;Timer.c: 36: msCounter=0;
	clrf	(_msCounter)
	clrf	(_msCounter+1)
	line	39
	
l3903:	
;Timer.c: 37: }
;Timer.c: 39: if(secCounter==60)
		movf	(_secCounter),w
	xorlw	60
	iorwf	(_secCounter+1),w

	skipz
	goto	u161
	goto	u160
u161:
	goto	l3909
u160:
	line	41
	
l3905:	
;Timer.c: 40: {
;Timer.c: 41: minCounter++;
	incf	(_minCounter),f
	skipnz
	incf	(_minCounter+1),f
	line	42
	
l3907:	
;Timer.c: 42: secCounter=0;
	clrf	(_secCounter)
	clrf	(_secCounter+1)
	line	45
	
l3909:	
;Timer.c: 43: }
;Timer.c: 45: if(minCounter==60)
		movf	(_minCounter),w
	xorlw	60
	iorwf	(_minCounter+1),w

	skipz
	goto	u171
	goto	u170
u171:
	goto	l3915
u170:
	line	47
	
l3911:	
;Timer.c: 46: {
;Timer.c: 47: hrCounter++;
	incf	(_hrCounter),f
	skipnz
	incf	(_hrCounter+1),f
	line	48
	
l3913:	
;Timer.c: 48: minCounter=0;
	clrf	(_minCounter)
	clrf	(_minCounter+1)
	line	51
	
l3915:	
;Timer.c: 49: }
;Timer.c: 51: if(hrCounter==24)
		movf	(_hrCounter),w
	xorlw	24
	iorwf	(_hrCounter+1),w

	skipz
	goto	u181
	goto	u180
u181:
	goto	l1984
u180:
	line	53
	
l3917:	
;Timer.c: 52: {
;Timer.c: 53: hrCounter = 0;
	clrf	(_hrCounter)
	clrf	(_hrCounter+1)
	line	55
	
l1984:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateTimeCounters
	__end_of_UpdateTimeCounters:
;; =============== function _UpdateTimeCounters ends ============

	signat	_UpdateTimeCounters,88
	global	_ISR
psect	text285,local,class=CODE,delta=2
global __ptext285
__ptext285:

;; *************** function _ISR *****************
;; Defined at:
;;		line 6 in file "C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\ISR.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text285
	file	"C:\Users\Saeed\Desktop\PIC16F877 Digital Clock Code\Code\ISR.c"
	line	6
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text285
	line	7
	
i1l3925:	
;ISR.c: 7: if(T0IF)
	btfss	(90/8),(90)&7
	goto	u19_21
	goto	u19_20
u19_21:
	goto	i1l2628
u19_20:
	line	9
	
i1l3927:	
;ISR.c: 8: {
;ISR.c: 9: TMR0 = 0x08;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	10
	
i1l3929:	
;ISR.c: 10: T0IF = 0;
	bcf	(90/8),(90)&7
	line	11
	
i1l3931:	
;ISR.c: 11: msCounter++;
	incf	(_msCounter),f
	skipnz
	incf	(_msCounter+1),f
	line	13
	
i1l2628:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text286,local,class=CODE,delta=2
global __ptext286
__ptext286:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
