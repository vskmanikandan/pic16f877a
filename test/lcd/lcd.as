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
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_lcd_data
	FNROOT	_main
	global	_PORTD
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:
_PORTD	set	8
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	file	"lcd.as"
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
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	3
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x3
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	3
	global	main@i
main@i:	; 2 bytes @ 0x7
	ds	2
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
;;   _main->_lcd_cmd
;;   _main->_lcd_data
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
;; (0) _main                                                 5     5      0      60
;;                                              4 COMMON     5     5      0
;;                            _lcd_cmd
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_data                                             4     4      0      15
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_cmd                                              4     4      0      15
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_cmd
;;   _lcd_data
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
;;STACK                0      0       1       2        0.0%
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
;;		line 29 in file "C:\Users\Mani\Desktop\pic16f877a\test\lcd\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    7[COMMON] int 
;; Return value:  Size  Location     Type
;;                  2  692[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mani\Desktop\pic16f877a\test\lcd\lcd.c"
	line	29
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l1845:	
;lcd.c: 30: TRISC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	31
;lcd.c: 31: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	32
	
l1847:	
;lcd.c: 32: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	33
	
l1849:	
;lcd.c: 33: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	34
	
l1851:	
;lcd.c: 34: lcd_cmd(0x02);
	movlw	(02h)
	fcall	_lcd_cmd
	line	35
	
l1853:	
;lcd.c: 35: lcd_cmd(0x0F);
	movlw	(0Fh)
	fcall	_lcd_cmd
	line	38
;lcd.c: 38: for(int i = 0; i<10; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l1855:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2145
	movlw	low(0Ah)
	subwf	(main@i),w
u2145:

	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l1859
u2140:
	goto	l696
	
l1857:	
	goto	l696
	line	39
	
l693:	
	line	40
	
l1859:	
;lcd.c: 39: {
;lcd.c: 40: lcd_data('B');
	movlw	(042h)
	fcall	_lcd_data
	line	41
	
l1861:	
;lcd.c: 41: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2167:
	decfsz	((??_main+0)+0),f
	goto	u2167
	decfsz	((??_main+0)+0+1),f
	goto	u2167
	decfsz	((??_main+0)+0+2),f
	goto	u2167
	clrwdt
opt asmopt_on

	line	38
	
l1863:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1865:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2155
	movlw	low(0Ah)
	subwf	(main@i),w
u2155:

	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l1859
u2150:
	goto	l696
	
l694:	
	goto	l696
	line	43
;lcd.c: 42: }
;lcd.c: 43: while(1);
	
l695:	
	
l696:	
	goto	l696
	
l697:	
	line	44
	
l698:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_data
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 19 in file "C:\Users\Mani\Desktop\pic16f877a\test\lcd\lcd.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text73
	file	"C:\Users\Mani\Desktop\pic16f877a\test\lcd\lcd.c"
	line	19
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 7
; Regs used in _lcd_data: [wreg]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	20
	
l1839:	
;lcd.c: 20: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	21
;lcd.c: 21: RC1 = 0;
	bcf	(57/8),(57)&7
	line	22
;lcd.c: 22: RC2 = 1;
	bsf	(58/8),(58)&7
	line	23
	
l1841:	
;lcd.c: 23: PORTD = data;
	movf	(lcd_data@data),w
	movwf	(8)	;volatile
	line	24
;lcd.c: 24: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_data+0)+0+2),f
movlw	68
movwf	((??_lcd_data+0)+0+1),f
	movlw	169
movwf	((??_lcd_data+0)+0),f
u2177:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2177
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2177
	decfsz	((??_lcd_data+0)+0+2),f
	goto	u2177
	clrwdt
opt asmopt_on

	line	25
	
l1843:	
;lcd.c: 25: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	26
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_cmd
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 9 in file "C:\Users\Mani\Desktop\pic16f877a\test\lcd\lcd.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    3[COMMON] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text74
	file	"C:\Users\Mani\Desktop\pic16f877a\test\lcd\lcd.c"
	line	9
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 7
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	10
	
l1833:	
;lcd.c: 10: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	11
;lcd.c: 11: RC1 = 0;
	bcf	(57/8),(57)&7
	line	12
;lcd.c: 12: RC2 = 1;
	bsf	(58/8),(58)&7
	line	13
	
l1835:	
;lcd.c: 13: PORTD = cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(8)	;volatile
	line	14
;lcd.c: 14: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_cmd+0)+0+2),f
movlw	68
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	169
movwf	((??_lcd_cmd+0)+0),f
u2187:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2187
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2187
	decfsz	((??_lcd_cmd+0)+0+2),f
	goto	u2187
	clrwdt
opt asmopt_on

	line	15
	
l1837:	
;lcd.c: 15: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	16
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
