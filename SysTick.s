; SysTick.s
; Module written by: **-UUU-*Your Names**update this***
; Date Created: 2/14/2017
; Last Modified: 8/29/2018 
; Brief Description: Initializes SysTick

NVIC_ST_CTRL_R        EQU 0xE000E010
NVIC_ST_RELOAD_R      EQU 0xE000E014
NVIC_ST_CURRENT_R     EQU 0xE000E018

        AREA    |.text|, CODE, READONLY, ALIGN=2
        THUMB
; -UUU- You add code here to export your routine(s) from SysTick.s to main.s
        EXPORT SysTick_Init
;------------SysTick_Init------------
; ;-UUU-Complete this subroutine
; Initialize SysTick running at bus clock.
; Make it so NVIC_ST_CURRENT_R can be used as a 24-bit time
; Input: none
; Output: none
; Modifies: ??
SysTick_Init
 ; **-UUU-**Implement this function****
 ;Clear control of SYSTICK
 	LDR	R0,=NVIC_ST_CTRL_R
	LDR	R1,[R0]
	MOV	R1,#0
	STR	R1,[R0]
;set reload of systick so that it equals 210 ms at a 16 MHz clock
	LDR	R0,=NVIC_ST_RELOAD_R
	LDR	R1,=0xFFFFFF
	STR	R1,[R0]
;Put any value into current to clear it	
	LDR	R0,=NVIC_ST_CURRENT_R
	MOV	R1,#0
	STR	R1,[R0]
;Set control to 5 so bit 0 and 2 so uses bus clock and is enabled. 	
	LDR	R0,=NVIC_ST_CTRL_R
	LDR	R1,[R0]
	MOV R1,#5
	STR	R1,[R0]
	
    BX  LR                          ; return


    ALIGN                           ; make sure the end of this section is aligned
    END                             ; end of file
