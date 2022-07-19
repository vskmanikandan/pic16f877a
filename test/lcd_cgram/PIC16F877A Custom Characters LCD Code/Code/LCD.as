opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F877A
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
# 11 "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 11 "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFFF & 0xFFFF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_InitLCD
	FNCALL	_main,_WriteDataToLCD
	FNCALL	_InitLCD,_WriteCommandToLCD
	FNCALL	_InitLCD,_LCDBuildChar
	FNCALL	_LCDBuildChar,_WriteCommandToLCD
	FNCALL	_LCDBuildChar,_WriteDataToLCD
	FNROOT	_main
	global	_CurvyObject
	global	_SquareBox
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.h"
	line	15

;initializer for _CurvyObject
	retlw	01h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	011h
	retlw	01Fh
	retlw	0
	line	16

;initializer for _SquareBox
	retlw	0
	retlw	01Fh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	01Fh
	retlw	0
	retlw	0
	global	_PORTB
_PORTB	set	6
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_TRISB
_TRISB	set	134
	global	_TRISD0
_TRISD0	set	1088
	global	_TRISD1
_TRISD1	set	1089
	file	"LCD.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.h"
	line	15
_CurvyObject:
       ds      8

psect	dataBANK0
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.h"
	line	16
_SquareBox:
       ds      8

; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
	fcall	__pidataBANK0+8		;fetch initializer
	movwf	__pdataBANK0+8&07fh		
	fcall	__pidataBANK0+9		;fetch initializer
	movwf	__pdataBANK0+9&07fh		
	fcall	__pidataBANK0+10		;fetch initializer
	movwf	__pdataBANK0+10&07fh		
	fcall	__pidataBANK0+11		;fetch initializer
	movwf	__pdataBANK0+11&07fh		
	fcall	__pidataBANK0+12		;fetch initializer
	movwf	__pdataBANK0+12&07fh		
	fcall	__pidataBANK0+13		;fetch initializer
	movwf	__pdataBANK0+13&07fh		
	fcall	__pidataBANK0+14		;fetch initializer
	movwf	__pdataBANK0+14&07fh		
	fcall	__pidataBANK0+15		;fetch initializer
	movwf	__pdataBANK0+15&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_WriteCommandToLCD
?_WriteCommandToLCD:	; 0 bytes @ 0x0
	global	??_WriteCommandToLCD
??_WriteCommandToLCD:	; 0 bytes @ 0x0
	global	?_WriteDataToLCD
?_WriteDataToLCD:	; 0 bytes @ 0x0
	global	??_WriteDataToLCD
??_WriteDataToLCD:	; 0 bytes @ 0x0
	global	?_InitLCD
?_InitLCD:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	WriteCommandToLCD@Command
WriteCommandToLCD@Command:	; 1 bytes @ 0x2
	global	WriteDataToLCD@LCDChar
WriteDataToLCD@LCDChar:	; 1 bytes @ 0x2
	ds	1
	global	?_LCDBuildChar
?_LCDBuildChar:	; 0 bytes @ 0x3
	global	LCDBuildChar@p
LCDBuildChar@p:	; 1 bytes @ 0x3
	ds	1
	global	??_LCDBuildChar
??_LCDBuildChar:	; 0 bytes @ 0x4
	ds	1
	global	LCDBuildChar@loc
LCDBuildChar@loc:	; 1 bytes @ 0x5
	ds	1
	global	LCDBuildChar@i
LCDBuildChar@i:	; 1 bytes @ 0x6
	ds	1
	global	??_InitLCD
??_InitLCD:	; 0 bytes @ 0x7
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0xA
;;Data sizes: Strings 0, constant 0, data 16, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80      0      16
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; LCDBuildChar@p	PTR unsigned char  size(1) Largest target is 8
;;		 -> SquareBox(BANK0[8]), CurvyObject(BANK0[8]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_InitLCD
;;   _InitLCD->_LCDBuildChar
;;   _LCDBuildChar->_WriteCommandToLCD
;;   _LCDBuildChar->_WriteDataToLCD
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
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
;; (0) _main                                                 0     0      0     222
;;                            _InitLCD
;;                     _WriteDataToLCD
;; ---------------------------------------------------------------------------------
;; (1) _InitLCD                                              3     3      0     200
;;                                              7 COMMON     3     3      0
;;                  _WriteCommandToLCD
;;                       _LCDBuildChar
;; ---------------------------------------------------------------------------------
;; (2) _LCDBuildChar                                         4     3      1     178
;;                                              3 COMMON     4     3      1
;;                  _WriteCommandToLCD
;;                     _WriteDataToLCD
;; ---------------------------------------------------------------------------------
;; (1) _WriteDataToLCD                                       3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _WriteCommandToLCD                                    3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _InitLCD
;;     _WriteCommandToLCD
;;     _LCDBuildChar
;;       _WriteCommandToLCD
;;       _WriteDataToLCD
;;   _WriteDataToLCD
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1D      12        0.0%
;;ABS                  0      0      1A       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0      10       5       20.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       A       1       71.4%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 16 in file "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_InitLCD
;;		_WriteDataToLCD
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\Main.c"
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	17
	
l2595:	
;Main.c: 17: InitLCD();
	fcall	_InitLCD
	line	19
	
l2597:	
;Main.c: 19: WriteDataToLCD(0x00);
	movlw	(0)
	fcall	_WriteDataToLCD
	line	20
	
l2599:	
;Main.c: 20: WriteDataToLCD(' ');
	movlw	(020h)
	fcall	_WriteDataToLCD
	line	21
	
l2601:	
;Main.c: 21: WriteDataToLCD(0x01);
	movlw	(01h)
	fcall	_WriteDataToLCD
	line	25
;Main.c: 24: {
	
l1402:	
	line	23
	goto	l1402
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	26
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_InitLCD
psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:

;; *************** function _InitLCD *****************
;; Defined at:
;;		line 29 in file "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_WriteCommandToLCD
;;		_LCDBuildChar
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text108
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
	line	29
	global	__size_of_InitLCD
	__size_of_InitLCD	equ	__end_of_InitLCD-_InitLCD
	
_InitLCD:	
	opt	stack 5
; Regs used in _InitLCD: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	31
	
l2561:	
;LCD.c: 31: RD0 = 0;
	bcf	(64/8),(64)&7
	line	32
;LCD.c: 32: RD1 = 0;
	bcf	(65/8),(65)&7
	line	33
	
l2563:	
;LCD.c: 33: PORTB = 0;
	clrf	(6)	;volatile
	line	34
	
l2565:	
;LCD.c: 34: TRISD0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1088/8)^080h,(1088)&7
	line	35
	
l2567:	
;LCD.c: 35: TRISD1 = 0;
	bcf	(1089/8)^080h,(1089)&7
	line	36
;LCD.c: 36: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	39
	
l2569:	
;LCD.c: 39: _delay((unsigned long)((40)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_InitLCD+0)+0+2),f
movlw	4
movwf	((??_InitLCD+0)+0+1),f
	movlw	186
movwf	((??_InitLCD+0)+0),f
u57:
	decfsz	((??_InitLCD+0)+0),f
	goto	u57
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u57
	decfsz	((??_InitLCD+0)+0+2),f
	goto	u57
	clrwdt
opt asmopt_on

	line	40
	
l2571:	
;LCD.c: 40: WriteCommandToLCD(0x30);
	movlw	(030h)
	fcall	_WriteCommandToLCD
	line	42
	
l2573:	
;LCD.c: 42: _delay((unsigned long)((6)*(20000000/4000.0)));
	opt asmopt_off
movlw	39
movwf	((??_InitLCD+0)+0+1),f
	movlw	245
movwf	((??_InitLCD+0)+0),f
u67:
	decfsz	((??_InitLCD+0)+0),f
	goto	u67
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u67
opt asmopt_on

	line	43
	
l2575:	
;LCD.c: 43: WriteCommandToLCD(0x30);
	movlw	(030h)
	fcall	_WriteCommandToLCD
	line	45
	
l2577:	
;LCD.c: 45: _delay((unsigned long)((300)*(20000000/4000000.0)));
	opt asmopt_off
movlw	214
movwf	(??_InitLCD+0)+0,f
u77:
	nop2
	nop2
decfsz	(??_InitLCD+0)+0,f
	goto	u77
	clrwdt
opt asmopt_on

	line	46
	
l2579:	
;LCD.c: 46: WriteCommandToLCD(0x30);
	movlw	(030h)
	fcall	_WriteCommandToLCD
	line	48
	
l2581:	
;LCD.c: 48: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_InitLCD+0)+0+1),f
	movlw	251
movwf	((??_InitLCD+0)+0),f
u87:
	decfsz	((??_InitLCD+0)+0),f
	goto	u87
	decfsz	((??_InitLCD+0)+0+1),f
	goto	u87
	nop2
opt asmopt_on

	line	50
	
l2583:	
;LCD.c: 50: WriteCommandToLCD(0x38);
	movlw	(038h)
	fcall	_WriteCommandToLCD
	line	51
	
l2585:	
;LCD.c: 51: WriteCommandToLCD(0x0c);
	movlw	(0Ch)
	fcall	_WriteCommandToLCD
	line	52
	
l2587:	
;LCD.c: 52: WriteCommandToLCD(0x01);
	movlw	(01h)
	fcall	_WriteCommandToLCD
	line	53
	
l2589:	
;LCD.c: 53: WriteCommandToLCD(0x06);
	movlw	(06h)
	fcall	_WriteCommandToLCD
	line	56
	
l2591:	
;LCD.c: 56: LCDBuildChar(0, CurvyObject);
	movlw	(_CurvyObject)&0ffh
	movwf	(?_LCDBuildChar)
	movlw	(0)
	fcall	_LCDBuildChar
	line	57
	
l2593:	
;LCD.c: 57: LCDBuildChar(1, SquareBox);
	movlw	(_SquareBox)&0ffh
	movwf	(?_LCDBuildChar)
	movlw	(01h)
	fcall	_LCDBuildChar
	line	58
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_InitLCD
	__end_of_InitLCD:
;; =============== function _InitLCD ends ============

	signat	_InitLCD,88
	global	_LCDBuildChar
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function _LCDBuildChar *****************
;; Defined at:
;;		line 80 in file "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;  loc             1    wreg     unsigned char 
;;  p               1    3[COMMON] PTR unsigned char 
;;		 -> SquareBox(8), CurvyObject(8), 
;; Auto vars:     Size  Location     Type
;;  loc             1    5[COMMON] unsigned char 
;;  i               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_WriteCommandToLCD
;;		_WriteDataToLCD
;; This function is called by:
;;		_InitLCD
;; This function uses a non-reentrant model
;;
psect	text109
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
	line	80
	global	__size_of_LCDBuildChar
	__size_of_LCDBuildChar	equ	__end_of_LCDBuildChar-_LCDBuildChar
	
_LCDBuildChar:	
	opt	stack 5
; Regs used in _LCDBuildChar: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LCDBuildChar@loc stored from wreg
	line	83
	movwf	(LCDBuildChar@loc)
	
l2543:	
;LCD.c: 81: unsigned char i;
;LCD.c: 83: if(loc<8)
	movlw	(08h)
	subwf	(LCDBuildChar@loc),w
	skipnc
	goto	u31
	goto	u30
u31:
	goto	l2559
u30:
	line	85
	
l2545:	
;LCD.c: 84: {
;LCD.c: 85: WriteCommandToLCD(0x40+(loc*8));
	movf	(LCDBuildChar@loc),w
	movwf	(??_LCDBuildChar+0)+0
	clrc
	rlf	(??_LCDBuildChar+0)+0,f
	clrc
	rlf	(??_LCDBuildChar+0)+0,f
	clrc
	rlf	(??_LCDBuildChar+0)+0,w
	addlw	040h
	fcall	_WriteCommandToLCD
	line	86
	
l2547:	
;LCD.c: 86: for(i=0;i<8;i++)
	clrf	(LCDBuildChar@i)
	line	87
	
l2553:	
;LCD.c: 87: WriteDataToLCD(p[i]);
	movf	(LCDBuildChar@i),w
	addwf	(LCDBuildChar@p),w
	movwf	(??_LCDBuildChar+0)+0
	movf	0+(??_LCDBuildChar+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_WriteDataToLCD
	line	86
	
l2555:	
	incf	(LCDBuildChar@i),f
	
l2557:	
	movlw	(08h)
	subwf	(LCDBuildChar@i),w
	skipc
	goto	u41
	goto	u40
u41:
	goto	l2553
u40:
	line	89
	
l2559:	
;LCD.c: 88: }
;LCD.c: 89: WriteCommandToLCD(0x80);
	movlw	(080h)
	fcall	_WriteCommandToLCD
	line	90
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_LCDBuildChar
	__end_of_LCDBuildChar:
;; =============== function _LCDBuildChar ends ============

	signat	_LCDBuildChar,8312
	global	_WriteDataToLCD
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:

;; *************** function _WriteDataToLCD *****************
;; Defined at:
;;		line 17 in file "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;  LCDChar         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  LCDChar         1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LCDBuildChar
;;		_main
;; This function uses a non-reentrant model
;;
psect	text110
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
	line	17
	global	__size_of_WriteDataToLCD
	__size_of_WriteDataToLCD	equ	__end_of_WriteDataToLCD-_WriteDataToLCD
	
_WriteDataToLCD:	
	opt	stack 7
; Regs used in _WriteDataToLCD: [wreg]
;WriteDataToLCD@LCDChar stored from wreg
	movwf	(WriteDataToLCD@LCDChar)
	line	18
	
l2535:	
;LCD.c: 18: RD1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	19
	
l2537:	
;LCD.c: 19: PORTB = LCDChar;
	movf	(WriteDataToLCD@LCDChar),w
	movwf	(6)	;volatile
	line	21
	
l2539:	
;LCD.c: 21: RD0 = 1;
	bsf	(64/8),(64)&7
	line	22
;LCD.c: 22: _delay((unsigned long)((500)*(20000000/4000000.0)));
	opt asmopt_off
movlw	4
movwf	((??_WriteDataToLCD+0)+0+1),f
	movlw	61
movwf	((??_WriteDataToLCD+0)+0),f
u97:
	decfsz	((??_WriteDataToLCD+0)+0),f
	goto	u97
	decfsz	((??_WriteDataToLCD+0)+0+1),f
	goto	u97
	nop2
opt asmopt_on

	line	23
	
l2541:	
;LCD.c: 23: RD0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	24
;LCD.c: 24: _delay((unsigned long)((500)*(20000000/4000000.0)));
	opt asmopt_off
movlw	4
movwf	((??_WriteDataToLCD+0)+0+1),f
	movlw	61
movwf	((??_WriteDataToLCD+0)+0),f
u107:
	decfsz	((??_WriteDataToLCD+0)+0),f
	goto	u107
	decfsz	((??_WriteDataToLCD+0)+0+1),f
	goto	u107
	nop2
opt asmopt_on

	line	25
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_WriteDataToLCD
	__end_of_WriteDataToLCD:
;; =============== function _WriteDataToLCD ends ============

	signat	_WriteDataToLCD,4216
	global	_WriteCommandToLCD
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:

;; *************** function _WriteCommandToLCD *****************
;; Defined at:
;;		line 6 in file "C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
;; Parameters:    Size  Location     Type
;;  Command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Command         1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_InitLCD
;;		_LCDBuildChar
;; This function uses a non-reentrant model
;;
psect	text111
	file	"C:\Users\Saeed\Desktop\PIC16F877A Custom Characters LCD Code\Code\LCD.c"
	line	6
	global	__size_of_WriteCommandToLCD
	__size_of_WriteCommandToLCD	equ	__end_of_WriteCommandToLCD-_WriteCommandToLCD
	
_WriteCommandToLCD:	
	opt	stack 5
; Regs used in _WriteCommandToLCD: [wreg]
;WriteCommandToLCD@Command stored from wreg
	movwf	(WriteCommandToLCD@Command)
	line	7
	
l2527:	
;LCD.c: 7: RD1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(65/8),(65)&7
	line	8
	
l2529:	
;LCD.c: 8: PORTB = Command;
	movf	(WriteCommandToLCD@Command),w
	movwf	(6)	;volatile
	line	10
	
l2531:	
;LCD.c: 10: RD0 = 1;
	bsf	(64/8),(64)&7
	line	11
;LCD.c: 11: _delay((unsigned long)((500)*(20000000/4000000.0)));
	opt asmopt_off
movlw	4
movwf	((??_WriteCommandToLCD+0)+0+1),f
	movlw	61
movwf	((??_WriteCommandToLCD+0)+0),f
u117:
	decfsz	((??_WriteCommandToLCD+0)+0),f
	goto	u117
	decfsz	((??_WriteCommandToLCD+0)+0+1),f
	goto	u117
	nop2
opt asmopt_on

	line	12
	
l2533:	
;LCD.c: 12: RD0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	13
;LCD.c: 13: _delay((unsigned long)((500)*(20000000/4000000.0)));
	opt asmopt_off
movlw	4
movwf	((??_WriteCommandToLCD+0)+0+1),f
	movlw	61
movwf	((??_WriteCommandToLCD+0)+0),f
u127:
	decfsz	((??_WriteCommandToLCD+0)+0),f
	goto	u127
	decfsz	((??_WriteCommandToLCD+0)+0+1),f
	goto	u127
	nop2
opt asmopt_on

	line	14
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_WriteCommandToLCD
	__end_of_WriteCommandToLCD:
;; =============== function _WriteCommandToLCD ends ============

	signat	_WriteCommandToLCD,4216
psect	text112,local,class=CODE,delta=2
global __ptext112
__ptext112:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
