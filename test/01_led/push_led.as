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
# 3 "C:\Users\Mani\Desktop\pic16f877a\test\push_led\push_led.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "C:\Users\Mani\Desktop\pic16f877a\test\push_led\push_led.c"
	dw 0x1F7A ;#
	FNROOT	_main
	global	_PORTB
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_PORTB	set	6
	global	_TRISB
_TRISB	set	134
	file	"push_led.as"
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
	global	main@x
main@x:	; 1 bytes @ 0x3
	ds	1
	global	main@y
main@y:	; 1 bytes @ 0x4
	ds	1
	global	main@op
main@op:	; 1 bytes @ 0x5
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x6
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;; (0) _main                                                 7     7      0     180
;;                                              0 COMMON     7     7      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       7       1       50.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
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
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 12 in file "C:\Users\Mani\Desktop\pic16f877a\test\push_led\push_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[COMMON] unsigned char 
;;  op              1    5[COMMON] unsigned char 
;;  y               1    4[COMMON] unsigned char 
;;  x               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mani\Desktop\pic16f877a\test\push_led\push_led.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0]
	line	13
;push_led.c: 13: while(1)
	
l687:	
	line	15
	
l1831:	
;push_led.c: 14: {
;push_led.c: 15: unsigned char x = 128;
	movlw	(080h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x)
	line	16
	
l1833:	
;push_led.c: 16: unsigned char y = 1;
	clrf	(main@y)
	bsf	status,0
	rlf	(main@y),f
	line	18
	
l1835:	
;push_led.c: 17: unsigned char op;
;push_led.c: 18: unsigned char i = 0;
	clrf	(main@i)
	line	19
	
l1837:	
;push_led.c: 19: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	20
	
l1839:	
;push_led.c: 20: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	21
;push_led.c: 21: while(i<=3)
	goto	l1847
	
l689:	
	line	23
	
l1841:	
;push_led.c: 22: {
;push_led.c: 23: op = (x >> i | y << i);
	movf	(main@y),w
	movwf	(??_main+0)+0
	incf	(main@i),w
	goto	u2144
u2145:
	clrc
	rlf	(??_main+0)+0,f
u2144:
	addlw	-1
	skipz
	goto	u2145
	movf	(main@x),w
	movwf	(??_main+1)+0
	incf	(main@i),w
	goto	u2154
u2155:
	clrc
	rrf	(??_main+1)+0,f
u2154:
	addlw	-1
	skipz
	goto	u2155
	movf	0+(??_main+1)+0,w
	iorwf	0+(??_main+0)+0,w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	(main@op)
	line	24
	
l1843:	
;push_led.c: 24: PORTB = op;
	movf	(main@op),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	26
	
l1845:	
;push_led.c: 26: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_main+0)+0+2),f
movlw	163
movwf	((??_main+0)+0+1),f
	movlw	189
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	decfsz	((??_main+0)+0+2),f
	goto	u2207
	clrwdt
opt asmopt_on

	line	28
;push_led.c: 28: i++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	goto	l1847
	line	29
	
l688:	
	line	21
	
l1847:	
	movlw	(04h)
	subwf	(main@i),w
	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l1841
u2160:
	
l690:	
	line	30
;push_led.c: 29: }
;push_led.c: 30: i = 0;
	clrf	(main@i)
	line	31
	
l1849:	
;push_led.c: 31: x =4 ; y = 32;
	movlw	(04h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x)
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@y)
	line	32
;push_led.c: 32: while(i<2)
	goto	l1857
	
l692:	
	line	34
	
l1851:	
;push_led.c: 33: {
;push_led.c: 34: op = (x >> i | y << i);
	movf	(main@y),w
	movwf	(??_main+0)+0
	incf	(main@i),w
	goto	u2174
u2175:
	clrc
	rlf	(??_main+0)+0,f
u2174:
	addlw	-1
	skipz
	goto	u2175
	movf	(main@x),w
	movwf	(??_main+1)+0
	incf	(main@i),w
	goto	u2184
u2185:
	clrc
	rrf	(??_main+1)+0,f
u2184:
	addlw	-1
	skipz
	goto	u2185
	movf	0+(??_main+1)+0,w
	iorwf	0+(??_main+0)+0,w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	(main@op)
	line	35
	
l1853:	
;push_led.c: 35: PORTB = op;
	movf	(main@op),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	37
	
l1855:	
;push_led.c: 37: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_main+0)+0+2),f
movlw	163
movwf	((??_main+0)+0+1),f
	movlw	189
movwf	((??_main+0)+0),f
u2217:
	decfsz	((??_main+0)+0),f
	goto	u2217
	decfsz	((??_main+0)+0+1),f
	goto	u2217
	decfsz	((??_main+0)+0+2),f
	goto	u2217
	clrwdt
opt asmopt_on

	line	39
;push_led.c: 39: i++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	goto	l1857
	line	40
	
l691:	
	line	32
	
l1857:	
	movlw	(02h)
	subwf	(main@i),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l1851
u2190:
	goto	l687
	
l693:	
	goto	l687
	line	42
	
l694:	
	line	13
	goto	l687
	
l695:	
	line	43
	
l696:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
