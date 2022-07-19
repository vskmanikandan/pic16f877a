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
	FNCALL	_main,_lcd_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_lcd_disp
	FNCALL	_lcd_init,_lcd_cmd
	FNROOT	_main
	global	_PORTB
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:
_PORTB	set	6
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_RCIF
_RCIF	set	101
	global	_RD5
_RD5	set	69
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_TXSTA
_TXSTA	set	152
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRISD5
_TRISD5	set	1093
	global	_TRISD6
_TRISD6	set	1094
	global	_TRISD7
_TRISD7	set	1095
	file	"usart_02.as"
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
	global	?_lcd_disp
?_lcd_disp:	; 0 bytes @ 0x0
	global	??_lcd_disp
??_lcd_disp:	; 0 bytes @ 0x0
	global	?_uart_init
?_uart_init:	; 0 bytes @ 0x0
	global	??_uart_init
??_uart_init:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	3
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x3
	global	lcd_disp@data
lcd_disp@data:	; 1 bytes @ 0x3
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x4
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	1
	global	main@RData
main@RData:	; 1 bytes @ 0x8
	ds	1
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
;;   _main->_lcd_init
;;   _lcd_init->_lcd_cmd
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0      45
;;                                              7 COMMON     2     2      0
;;                           _lcd_init
;;                          _uart_init
;;                           _lcd_disp
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             3     3      0      15
;;                                              4 COMMON     3     3      0
;;                            _lcd_cmd
;; ---------------------------------------------------------------------------------
;; (1) _lcd_disp                                             4     4      0      15
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _lcd_cmd                                              4     4      0      15
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_cmd
;;   _uart_init
;;   _lcd_disp
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
;;		line 65 in file "C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RData           1    8[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_init
;;		_uart_init
;;		_lcd_disp
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
	line	65
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	67
	
l1886:	
;usart_02.c: 66: unsigned char RData;
;usart_02.c: 67: lcd_init();
	fcall	_lcd_init
	line	68
;usart_02.c: 68: uart_init();
	fcall	_uart_init
	goto	l700
	line	70
;usart_02.c: 70: while(1)
	
l699:	
	line	72
;usart_02.c: 71: {
;usart_02.c: 72: while(RCIF==0);
	goto	l700
	
l701:	
	
l700:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u2141
	goto	u2140
u2141:
	goto	l700
u2140:
	goto	l1888
	
l702:	
	line	73
	
l1888:	
;usart_02.c: 73: RData=RCREG;
	movf	(26),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@RData)
	line	74
	
l1890:	
;usart_02.c: 74: lcd_disp(RData);
	movf	(main@RData),w
	fcall	_lcd_disp
	goto	l700
	line	76
	
l703:	
	line	70
	goto	l700
	
l704:	
	line	77
	
l705:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text97,local,class=CODE,delta=2
global __ptext97
__ptext97:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 48 in file "C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
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
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text97
	file	"C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
	line	48
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	49
	
l1860:	
;usart_02.c: 49: TRISB=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	50
	
l1862:	
;usart_02.c: 50: TRISD5=0;
	bcf	(1093/8)^080h,(1093)&7
	line	51
	
l1864:	
;usart_02.c: 51: TRISD6=0;
	bcf	(1094/8)^080h,(1094)&7
	line	52
	
l1866:	
;usart_02.c: 52: TRISD7=0;
	bcf	(1095/8)^080h,(1095)&7
	line	53
	
l1868:	
;usart_02.c: 53: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_init+0)+0+2),f
movlw	68
movwf	((??_lcd_init+0)+0+1),f
	movlw	169
movwf	((??_lcd_init+0)+0),f
u2157:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2157
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2157
	decfsz	((??_lcd_init+0)+0+2),f
	goto	u2157
	clrwdt
opt asmopt_on

	line	54
	
l1870:	
;usart_02.c: 54: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	55
	
l1872:	
;usart_02.c: 55: lcd_cmd(0x0F);
	movlw	(0Fh)
	fcall	_lcd_cmd
	line	56
	
l1874:	
;usart_02.c: 56: lcd_cmd(0x0C);
	movlw	(0Ch)
	fcall	_lcd_cmd
	line	57
	
l1876:	
;usart_02.c: 57: lcd_cmd(0x02);
	movlw	(02h)
	fcall	_lcd_cmd
	line	58
	
l1878:	
;usart_02.c: 58: lcd_cmd(0x06);
	movlw	(06h)
	fcall	_lcd_cmd
	line	59
	
l1880:	
;usart_02.c: 59: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	60
	
l1882:	
;usart_02.c: 60: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_init+0)+0+2),f
movlw	68
movwf	((??_lcd_init+0)+0+1),f
	movlw	169
movwf	((??_lcd_init+0)+0),f
u2167:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2167
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2167
	decfsz	((??_lcd_init+0)+0+2),f
	goto	u2167
	clrwdt
opt asmopt_on

	line	61
	
l1884:	
;usart_02.c: 61: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	62
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_disp
psect	text98,local,class=CODE,delta=2
global __ptext98
__ptext98:

;; *************** function _lcd_disp *****************
;; Defined at:
;;		line 25 in file "C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
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
psect	text98
	file	"C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
	line	25
	global	__size_of_lcd_disp
	__size_of_lcd_disp	equ	__end_of_lcd_disp-_lcd_disp
	
_lcd_disp:	
	opt	stack 7
; Regs used in _lcd_disp: [wreg]
;lcd_disp@data stored from wreg
	movwf	(lcd_disp@data)
	line	26
	
l1854:	
;usart_02.c: 26: RD5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(69/8),(69)&7
	line	27
;usart_02.c: 27: RD6 = 0;
	bcf	(70/8),(70)&7
	line	28
;usart_02.c: 28: RD7 = 1;
	bsf	(71/8),(71)&7
	line	29
	
l1856:	
;usart_02.c: 29: PORTB = data;
	movf	(lcd_disp@data),w
	movwf	(6)	;volatile
	line	30
;usart_02.c: 30: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_disp+0)+0+2),f
movlw	68
movwf	((??_lcd_disp+0)+0+1),f
	movlw	169
movwf	((??_lcd_disp+0)+0),f
u2177:
	decfsz	((??_lcd_disp+0)+0),f
	goto	u2177
	decfsz	((??_lcd_disp+0)+0+1),f
	goto	u2177
	decfsz	((??_lcd_disp+0)+0+2),f
	goto	u2177
	clrwdt
opt asmopt_on

	line	31
	
l1858:	
;usart_02.c: 31: RD7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(71/8),(71)&7
	line	32
;usart_02.c: 32: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_disp+0)+0+2),f
movlw	68
movwf	((??_lcd_disp+0)+0+1),f
	movlw	169
movwf	((??_lcd_disp+0)+0),f
u2187:
	decfsz	((??_lcd_disp+0)+0),f
	goto	u2187
	decfsz	((??_lcd_disp+0)+0+1),f
	goto	u2187
	decfsz	((??_lcd_disp+0)+0+2),f
	goto	u2187
	clrwdt
opt asmopt_on

	line	33
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_disp
	__end_of_lcd_disp:
;; =============== function _lcd_disp ends ============

	signat	_lcd_disp,4216
	global	_lcd_cmd
psect	text99,local,class=CODE,delta=2
global __ptext99
__ptext99:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 14 in file "C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
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
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text99
	file	"C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
	line	14
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 6
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	15
	
l1848:	
;usart_02.c: 15: RD5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(69/8),(69)&7
	line	16
;usart_02.c: 16: RD6 = 0;
	bcf	(70/8),(70)&7
	line	17
;usart_02.c: 17: RD7 = 1;
	bsf	(71/8),(71)&7
	line	18
	
l1850:	
;usart_02.c: 18: PORTB = cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(6)	;volatile
	line	19
;usart_02.c: 19: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_cmd+0)+0+2),f
movlw	68
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	169
movwf	((??_lcd_cmd+0)+0),f
u2197:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2197
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2197
	decfsz	((??_lcd_cmd+0)+0+2),f
	goto	u2197
	clrwdt
opt asmopt_on

	line	20
	
l1852:	
;usart_02.c: 20: RD7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(71/8),(71)&7
	line	21
;usart_02.c: 21: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_lcd_cmd+0)+0+2),f
movlw	68
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	169
movwf	((??_lcd_cmd+0)+0),f
u2207:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2207
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2207
	decfsz	((??_lcd_cmd+0)+0+2),f
	goto	u2207
	clrwdt
opt asmopt_on

	line	22
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_uart_init
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:

;; *************** function _uart_init *****************
;; Defined at:
;;		line 37 in file "C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text100
	file	"C:\Users\Mani\Desktop\pic16f877a\Protocol\USART\usart_02\usart_02.c"
	line	37
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 7
; Regs used in _uart_init: [wreg]
	line	38
	
l1074:	
;usart_02.c: 38: TRISC6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1086/8)^080h,(1086)&7
	line	39
;usart_02.c: 39: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	line	40
	
l1076:	
;usart_02.c: 40: TXSTA = 0X20;
	movlw	(020h)
	movwf	(152)^080h	;volatile
	line	41
;usart_02.c: 41: RCSTA = 0X90;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	42
;usart_02.c: 42: SPBRG = 31;
	movlw	(01Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	43
	
l1078:	
;usart_02.c: 43: TXIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(100/8),(100)&7
	line	44
	
l1080:	
;usart_02.c: 44: RCIF = 0;
	bcf	(101/8),(101)&7
	line	45
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,88
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
