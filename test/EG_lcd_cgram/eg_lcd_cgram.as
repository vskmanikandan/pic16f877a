opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

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
# 10 "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	psect config,class=CONFIG,delta=2 ;#
# 10 "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	dw 0x1F7A ;#
	FNCALL	_main,_lcdint
	FNCALL	_main,_lcdcmd
	FNCALL	_main,_display
	FNCALL	_lcdint,_delay
	FNCALL	_lcdint,_display
	FNCALL	_lcdint,_lcdcmd
	FNROOT	_main
	global	_PORTB
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:
_PORTB	set	6
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	file	"eg_lcd_cgram.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_lcdcmd
?_lcdcmd:	; 0 bytes @ 0x0
	global	??_lcdcmd
??_lcdcmd:	; 0 bytes @ 0x0
	global	?_display
?_display:	; 0 bytes @ 0x0
	global	??_display
??_display:	; 0 bytes @ 0x0
	global	?_lcdint
?_lcdint:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@time
delay@time:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	lcdcmd@value
lcdcmd@value:	; 1 bytes @ 0x2
	global	delay@i
delay@i:	; 2 bytes @ 0x2
	ds	1
	global	display@value
display@value:	; 1 bytes @ 0x3
	ds	1
	global	delay@j
delay@j:	; 2 bytes @ 0x4
	ds	2
	global	??_lcdint
??_lcdint:	; 0 bytes @ 0x6
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _lcdint->_delay
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0     120
;;                                              6 COMMON     3     3      0
;;                             _lcdint
;;                             _lcdcmd
;;                            _display
;; ---------------------------------------------------------------------------------
;; (1) _lcdint                                               0     0      0      90
;;                              _delay
;;                            _display
;;                             _lcdcmd
;; ---------------------------------------------------------------------------------
;; (1) _display                                              4     4      0      15
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _lcdcmd                                               3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                6     4      2      60
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcdint
;;     _delay
;;     _display
;;     _lcdcmd
;;   _lcdcmd
;;   _display
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
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 79 in file "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0        int 
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
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcdint
;;		_lcdcmd
;;		_display
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	line	79
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	81
	
l1904:	
;eg_lcd_cgram.c: 80: int i;
;eg_lcd_cgram.c: 81: lcdint();
	fcall	_lcdint
	line	83
;eg_lcd_cgram.c: 83: while(1){
	
l704:	
	line	84
;eg_lcd_cgram.c: 84: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	94
;eg_lcd_cgram.c: 94: lcdcmd(0x40);
	movlw	(040h)
	fcall	_lcdcmd
	line	95
;eg_lcd_cgram.c: 95: display(0x02);display(0x04);display(0x04);display(0x04);display(0x04);display(0x04);display(0x08);
	movlw	(02h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	movlw	(08h)
	fcall	_display
	line	96
;eg_lcd_cgram.c: 96: lcdcmd(0x40+8);
	movlw	(048h)
	fcall	_lcdcmd
	line	97
;eg_lcd_cgram.c: 97: display(0x00);display(0x00);display(0x00);display(0x11);display(0x0E);display(0X00);display(0X04);
	movlw	(0)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(011h)
	fcall	_display
	movlw	(0Eh)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(04h)
	fcall	_display
	line	98
;eg_lcd_cgram.c: 98: lcdcmd(0x40+16);
	movlw	(050h)
	fcall	_lcdcmd
	line	99
;eg_lcd_cgram.c: 99: display(0x00);display(0x00);display(0X11);display(0X0E);display(0x00);display(0X0A);display(0X04);
	movlw	(0)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(011h)
	fcall	_display
	movlw	(0Eh)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(0Ah)
	fcall	_display
	movlw	(04h)
	fcall	_display
	line	100
;eg_lcd_cgram.c: 100: lcdcmd(0x40+24);
	movlw	(058h)
	fcall	_lcdcmd
	line	101
;eg_lcd_cgram.c: 101: display(0x00);display(0x0A);display(0x00);display(0x11);display(0x0E);display(0x00);display(0x00);
	movlw	(0)
	fcall	_display
	movlw	(0Ah)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(011h)
	fcall	_display
	movlw	(0Eh)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(0)
	fcall	_display
	line	102
;eg_lcd_cgram.c: 102: lcdcmd(0x40+32);
	movlw	(060h)
	fcall	_lcdcmd
	line	103
;eg_lcd_cgram.c: 103: display(0x04);display(0x06);display(0x06);display(0x00);display(0x11);display(0x0E);display(0x00);
	movlw	(04h)
	fcall	_display
	movlw	(06h)
	fcall	_display
	movlw	(06h)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(011h)
	fcall	_display
	movlw	(0Eh)
	fcall	_display
	movlw	(0)
	fcall	_display
	line	104
;eg_lcd_cgram.c: 104: lcdcmd(0x40+40);
	movlw	(068h)
	fcall	_lcdcmd
	line	105
;eg_lcd_cgram.c: 105: display(0x00);display(0x0A);display(0x04);display(0x11);display(0x0E);display(0x00);display(0x00);
	movlw	(0)
	fcall	_display
	movlw	(0Ah)
	fcall	_display
	movlw	(04h)
	fcall	_display
	movlw	(011h)
	fcall	_display
	movlw	(0Eh)
	fcall	_display
	movlw	(0)
	fcall	_display
	movlw	(0)
	fcall	_display
	line	106
;eg_lcd_cgram.c: 106: lcdcmd(0x40+48);
	movlw	(070h)
	fcall	_lcdcmd
	line	107
;eg_lcd_cgram.c: 107: display(0x1F);display(0x12);display(0x14);display(0x08);display(0x14);display(0x11);display(0x04);
	movlw	(01Fh)
	fcall	_display
	movlw	(012h)
	fcall	_display
	movlw	(014h)
	fcall	_display
	movlw	(08h)
	fcall	_display
	movlw	(014h)
	fcall	_display
	movlw	(011h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	line	108
;eg_lcd_cgram.c: 108: lcdcmd(0x40+56);
	movlw	(078h)
	fcall	_lcdcmd
	line	109
;eg_lcd_cgram.c: 109: display(0x1F);display(0x12);display(0x14);display(0x08);display(0x16);display(0x15);display(0x04);
	movlw	(01Fh)
	fcall	_display
	movlw	(012h)
	fcall	_display
	movlw	(014h)
	fcall	_display
	movlw	(08h)
	fcall	_display
	movlw	(016h)
	fcall	_display
	movlw	(015h)
	fcall	_display
	movlw	(04h)
	fcall	_display
	line	111
	
l1906:	
;eg_lcd_cgram.c: 111: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_main+0)+0+2),f
movlw	163
movwf	((??_main+0)+0+1),f
	movlw	189
movwf	((??_main+0)+0),f
u2177:
	decfsz	((??_main+0)+0),f
	goto	u2177
	decfsz	((??_main+0)+0+1),f
	goto	u2177
	decfsz	((??_main+0)+0+2),f
	goto	u2177
	clrwdt
opt asmopt_on

	line	112
	
l1908:	
;eg_lcd_cgram.c: 112: lcdcmd(0x80);
	movlw	(080h)
	fcall	_lcdcmd
	line	113
	
l1910:	
;eg_lcd_cgram.c: 113: display(0);
	movlw	(0)
	fcall	_display
	line	114
	
l1912:	
;eg_lcd_cgram.c: 114: lcdcmd(0x81);
	movlw	(081h)
	fcall	_lcdcmd
	line	115
	
l1914:	
;eg_lcd_cgram.c: 115: display(1);
	movlw	(01h)
	fcall	_display
	line	116
	
l1916:	
;eg_lcd_cgram.c: 116: lcdcmd(0xC4);
	movlw	(0C4h)
	fcall	_lcdcmd
	line	117
	
l1918:	
;eg_lcd_cgram.c: 117: display(2);
	movlw	(02h)
	fcall	_display
	line	118
	
l1920:	
;eg_lcd_cgram.c: 118: lcdcmd(0xC6);
	movlw	(0C6h)
	fcall	_lcdcmd
	line	119
	
l1922:	
;eg_lcd_cgram.c: 119: display(3);
	movlw	(03h)
	fcall	_display
	line	120
	
l1924:	
;eg_lcd_cgram.c: 120: lcdcmd(0xC8);
	movlw	(0C8h)
	fcall	_lcdcmd
	line	121
	
l1926:	
;eg_lcd_cgram.c: 121: display(4);
	movlw	(04h)
	fcall	_display
	line	122
	
l1928:	
;eg_lcd_cgram.c: 122: lcdcmd(0xCA);
	movlw	(0CAh)
	fcall	_lcdcmd
	line	123
	
l1930:	
;eg_lcd_cgram.c: 123: display(5);
	movlw	(05h)
	fcall	_display
	line	124
	
l1932:	
;eg_lcd_cgram.c: 124: lcdcmd(0xCC);
	movlw	(0CCh)
	fcall	_lcdcmd
	line	125
	
l1934:	
;eg_lcd_cgram.c: 125: display(6);
	movlw	(06h)
	fcall	_display
	line	126
	
l1936:	
;eg_lcd_cgram.c: 126: lcdcmd(0xCE);
	movlw	(0CEh)
	fcall	_lcdcmd
	line	127
	
l1938:	
;eg_lcd_cgram.c: 127: display(7);
	movlw	(07h)
	fcall	_display
	goto	l704
	line	242
	
l705:	
	line	83
	goto	l704
	
l706:	
	line	243
	
l707:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcdint
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _lcdint *****************
;; Defined at:
;;		line 54 in file "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;;		_display
;;		_lcdcmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text85
	file	"C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	line	54
	global	__size_of_lcdint
	__size_of_lcdint	equ	__end_of_lcdint-_lcdint
	
_lcdint:	
	opt	stack 6
; Regs used in _lcdint: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l1868:	
;eg_lcd_cgram.c: 55: TRISB=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	56
;eg_lcd_cgram.c: 56: TRISC=0;
	clrf	(135)^080h	;volatile
	line	58
	
l1870:	
;eg_lcd_cgram.c: 58: delay(150);
	movlw	low(096h)
	movwf	(?_delay)
	movlw	high(096h)
	movwf	((?_delay))+1
	fcall	_delay
	line	59
	
l1872:	
;eg_lcd_cgram.c: 59: display(0x30);
	movlw	(030h)
	fcall	_display
	line	60
	
l1874:	
;eg_lcd_cgram.c: 60: delay(45);
	movlw	low(02Dh)
	movwf	(?_delay)
	movlw	high(02Dh)
	movwf	((?_delay))+1
	fcall	_delay
	line	61
	
l1876:	
;eg_lcd_cgram.c: 61: display(0x30);
	movlw	(030h)
	fcall	_display
	line	62
	
l1878:	
;eg_lcd_cgram.c: 62: delay(30);
	movlw	low(01Eh)
	movwf	(?_delay)
	movlw	high(01Eh)
	movwf	((?_delay))+1
	fcall	_delay
	line	63
	
l1880:	
;eg_lcd_cgram.c: 63: display(0x30);
	movlw	(030h)
	fcall	_display
	line	64
	
l1882:	
;eg_lcd_cgram.c: 64: delay(65);
	movlw	low(041h)
	movwf	(?_delay)
	movlw	high(041h)
	movwf	((?_delay))+1
	fcall	_delay
	line	65
	
l1884:	
;eg_lcd_cgram.c: 65: lcdcmd(0x38);
	movlw	(038h)
	fcall	_lcdcmd
	line	66
	
l1886:	
;eg_lcd_cgram.c: 66: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	67
	
l1888:	
;eg_lcd_cgram.c: 67: lcdcmd(0x0C);
	movlw	(0Ch)
	fcall	_lcdcmd
	line	68
	
l1890:	
;eg_lcd_cgram.c: 68: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	69
	
l1892:	
;eg_lcd_cgram.c: 69: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	70
	
l1894:	
;eg_lcd_cgram.c: 70: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	71
	
l1896:	
;eg_lcd_cgram.c: 71: lcdcmd(0x06);
	movlw	(06h)
	fcall	_lcdcmd
	line	72
	
l1898:	
;eg_lcd_cgram.c: 72: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	73
	
l1900:	
;eg_lcd_cgram.c: 73: lcdcmd(0x80);
	movlw	(080h)
	fcall	_lcdcmd
	line	74
	
l1902:	
;eg_lcd_cgram.c: 74: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	75
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_lcdint
	__end_of_lcdint:
;; =============== function _lcdint ends ============

	signat	_lcdint,88
	global	_display
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _display *****************
;; Defined at:
;;		line 40 in file "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    3[COMMON] unsigned char 
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
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcdint
;;		_main
;; This function uses a non-reentrant model
;;
psect	text86
	file	"C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	line	40
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 7
; Regs used in _display: [wreg]
;display@value stored from wreg
	movwf	(display@value)
	line	41
	
l1860:	
;eg_lcd_cgram.c: 41: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	42
;eg_lcd_cgram.c: 42: RC1 = 0;
	bcf	(57/8),(57)&7
	line	43
	
l1862:	
;eg_lcd_cgram.c: 43: PORTB = value;
	movf	(display@value),w
	movwf	(6)	;volatile
	line	44
	
l1864:	
;eg_lcd_cgram.c: 44: RC2 = 1;
	bsf	(58/8),(58)&7
	line	45
;eg_lcd_cgram.c: 45: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_display+0)+0+2),f
movlw	136
movwf	((??_display+0)+0+1),f
	movlw	86
movwf	((??_display+0)+0),f
u2187:
	decfsz	((??_display+0)+0),f
	goto	u2187
	decfsz	((??_display+0)+0+1),f
	goto	u2187
	decfsz	((??_display+0)+0+2),f
	goto	u2187
opt asmopt_on

	line	46
	
l1866:	
;eg_lcd_cgram.c: 46: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	47
;eg_lcd_cgram.c: 47: _delay((unsigned long)((10)*(20000000/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_display+0)+0+1),f
	movlw	238
movwf	((??_display+0)+0),f
u2197:
	decfsz	((??_display+0)+0),f
	goto	u2197
	decfsz	((??_display+0)+0+1),f
	goto	u2197
	clrwdt
opt asmopt_on

	line	50
	
l698:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,4216
	global	_lcdcmd
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _lcdcmd *****************
;; Defined at:
;;		line 29 in file "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    2[COMMON] unsigned char 
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
;;		_lcdint
;;		_main
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	line	29
	global	__size_of_lcdcmd
	__size_of_lcdcmd	equ	__end_of_lcdcmd-_lcdcmd
	
_lcdcmd:	
	opt	stack 7
; Regs used in _lcdcmd: [wreg]
;lcdcmd@value stored from wreg
	movwf	(lcdcmd@value)
	line	30
	
l1854:	
;eg_lcd_cgram.c: 30: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	31
;eg_lcd_cgram.c: 31: RC1 = 0;
	bcf	(57/8),(57)&7
	line	32
;eg_lcd_cgram.c: 32: RC2 = 1;
	bsf	(58/8),(58)&7
	line	33
	
l1856:	
;eg_lcd_cgram.c: 33: PORTB = value;
	movf	(lcdcmd@value),w
	movwf	(6)	;volatile
	line	34
;eg_lcd_cgram.c: 34: _delay((unsigned long)((25)*(20000000/4000.0)));
	opt asmopt_off
movlw	163
movwf	((??_lcdcmd+0)+0+1),f
	movlw	85
movwf	((??_lcdcmd+0)+0),f
u2207:
	decfsz	((??_lcdcmd+0)+0),f
	goto	u2207
	decfsz	((??_lcdcmd+0)+0+1),f
	goto	u2207
opt asmopt_on

	line	35
	
l1858:	
;eg_lcd_cgram.c: 35: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	37
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_lcdcmd
	__end_of_lcdcmd:
;; =============== function _lcdcmd ends ============

	signat	_lcdcmd,4216
	global	_delay
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:

;; *************** function _delay *****************
;; Defined at:
;;		line 21 in file "C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
;; Parameters:    Size  Location     Type
;;  time            2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    4[COMMON] unsigned int 
;;  i               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcdint
;; This function uses a non-reentrant model
;;
psect	text88
	file	"C:\Users\Mani\Desktop\pic16f877a\test\EG_lcd_cgram\eg_lcd_cgram.c"
	line	21
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg+status,2]
	line	23
	
l1076:	
;eg_lcd_cgram.c: 22: unsigned int i,j;
;eg_lcd_cgram.c: 23: for(i=0;i< time;i++)
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l687
	line	24
	
l688:	
	
l1078:	
;eg_lcd_cgram.c: 24: for(j=0;j< 30;j++);
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l1080:	
	movlw	high(01Eh)
	subwf	(delay@j+1),w
	movlw	low(01Eh)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l1084
u10:
	goto	l1086
	
l1082:	
	goto	l1086
	
l689:	
	
l1084:	
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	movlw	high(01Eh)
	subwf	(delay@j+1),w
	movlw	low(01Eh)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1084
u20:
	goto	l1086
	
l690:	
	line	23
	
l1086:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l687:	
	movf	(delay@time+1),w
	subwf	(delay@i+1),w
	skipz
	goto	u35
	movf	(delay@time),w
	subwf	(delay@i),w
u35:
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1078
u30:
	goto	l692
	
l691:	
	line	25
	
l692:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
