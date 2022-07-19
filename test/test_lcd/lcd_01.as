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
# 3 "C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	dw 0x1F7A ;#
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_lcd_data
	FNROOT	_main
	global	main@F1093
	global	main@F1091
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	line	33

;initializer for main@F1093
	retlw	01h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	011h
	retlw	01Fh
	retlw	0
	line	32

;initializer for main@F1091
	retlw	06Ch
	retlw	069h
	retlw	06Eh
	retlw	075h
	retlw	078h
	global	_PORTB
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
	file	"lcd_01.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	line	33
main@F1093:
       ds      8

psect	dataBANK0
	file	"C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	line	32
main@F1091:
       ds      5

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+13)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
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
	ds	2
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x2
	ds	1
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@CurvyObject
main@CurvyObject:	; 8 bytes @ 0x0
	ds	8
	global	main@x
main@x:	; 5 bytes @ 0x8
	ds	5
	global	main@i
main@i:	; 2 bytes @ 0xD
	ds	2
;;Data sizes: Strings 0, constant 0, data 13, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80     15      28
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
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
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                19    19      0     114
;;                                              4 COMMON     4     4      0
;;                                              0 BANK0     15    15      0
;;                            _lcd_cmd
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_data                                             4     4      0      22
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_cmd                                              3     3      0      22
;;                                              0 COMMON     3     3      0
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
;;DATA                 0      0      25      12        0.0%
;;ABS                  0      0      24       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      F      1C       5       35.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 31 in file "C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   13[BANK0 ] int 
;;  CurvyObject     8    0[BANK0 ] unsigned char [8]
;;  x               5    8[BANK0 ] unsigned char [5]
;; Return value:  Size  Location     Type
;;                  2  692[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      15       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      15       0       0       0
;;Total ram usage:       19 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	line	31
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	32
	
l1899:	
;lcd_01.c: 32: char x[] = { 'l','i','n','u','x'};
	movlw	(main@x)&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@F1091),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(main@F1091)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1091)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1091)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F1091)+4,w
	movwf	indf
	line	33
	
l1901:	
;lcd_01.c: 33: unsigned char CurvyObject[8] = { 0x01,0x02,0x04,0x08,0x10,0x11,0x1f,0x00 };
	movlw	(main@CurvyObject)&0ffh
	movwf	fsr0
	movlw	low(main@F1093)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2170:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2170
	line	34
	
l1903:	
;lcd_01.c: 34: TRISB = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	35
	
l1905:	
;lcd_01.c: 35: TRISC = 0;
	clrf	(135)^080h	;volatile
	line	37
	
l1907:	
;lcd_01.c: 37: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	39
	
l1909:	
;lcd_01.c: 39: lcd_cmd(0x0C);
	movlw	(0Ch)
	fcall	_lcd_cmd
	line	40
	
l1911:	
;lcd_01.c: 40: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	41
	
l1913:	
;lcd_01.c: 41: lcd_cmd(0x02);
	movlw	(02h)
	fcall	_lcd_cmd
	line	42
	
l1915:	
;lcd_01.c: 42: lcd_cmd(0x06);
	movlw	(06h)
	fcall	_lcd_cmd
	line	43
	
l1917:	
;lcd_01.c: 43: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	48
	
l1919:	
;lcd_01.c: 48: for(int i=0; i<=9; i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1921:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2185
	movlw	low(0Ah)
	subwf	(main@i),w
u2185:

	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l1925
u2180:
	goto	l1931
	
l1923:	
	goto	l1931
	line	49
	
l697:	
	line	51
	
l1925:	
;lcd_01.c: 49: {
;lcd_01.c: 51: lcd_data(i+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	030h
	fcall	_lcd_data
	line	54
;lcd_01.c: 54: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	48
	
l1927:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1929:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2195
	movlw	low(0Ah)
	subwf	(main@i),w
u2195:

	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l1925
u2190:
	goto	l1931
	
l698:	
	line	58
	
l1931:	
;lcd_01.c: 56: }
;lcd_01.c: 58: _delay((unsigned long)((500)*(20000000/4000.0)));
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

	goto	l700
	line	66
;lcd_01.c: 66: while(1);
	
l699:	
	
l700:	
	goto	l700
	
l701:	
	line	70
	
l702:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_data
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 18 in file "C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
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
psect	text109
	file	"C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	line	18
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 7
; Regs used in _lcd_data: [wreg]
;lcd_data@data stored from wreg
	line	20
	movwf	(lcd_data@data)
	
l1891:	
;lcd_01.c: 20: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	21
;lcd_01.c: 21: RC1 = 0;
	bcf	(57/8),(57)&7
	line	22
	
l1893:	
;lcd_01.c: 22: PORTB = data;
	movf	(lcd_data@data),w
	movwf	(6)	;volatile
	line	23
	
l1895:	
;lcd_01.c: 23: RC2 = 1;
	bsf	(58/8),(58)&7
	line	24
;lcd_01.c: 24: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcd_data+0)+0+2),f
movlw	136
movwf	((??_lcd_data+0)+0+1),f
	movlw	86
movwf	((??_lcd_data+0)+0),f
u2217:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2217
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2217
	decfsz	((??_lcd_data+0)+0+2),f
	goto	u2217
opt asmopt_on

	line	25
	
l1897:	
;lcd_01.c: 25: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	26
;lcd_01.c: 26: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_lcd_data+0)+0+1),f
	movlw	101
movwf	((??_lcd_data+0)+0),f
u2227:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2227
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2227
	nop2
opt asmopt_on

	line	27
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_cmd
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 9 in file "C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    2[COMMON] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text110
	file	"C:\Users\Mani\Desktop\pic16f877a\test\test_lcd\lcd_01.c"
	line	9
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 7
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	10
	
l1885:	
;lcd_01.c: 10: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	11
;lcd_01.c: 11: RC1 = 0;
	bcf	(57/8),(57)&7
	line	12
;lcd_01.c: 12: RC2 = 1;
	bsf	(58/8),(58)&7
	line	13
	
l1887:	
;lcd_01.c: 13: PORTB = cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(6)	;volatile
	line	14
;lcd_01.c: 14: _delay((unsigned long)((25)*(20000000/4000.0)));
	opt asmopt_off
movlw	163
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	85
movwf	((??_lcd_cmd+0)+0),f
u2237:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2237
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2237
opt asmopt_on

	line	15
	
l1889:	
;lcd_01.c: 15: RC2 = 0;
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
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
