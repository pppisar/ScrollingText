; podprogramy pro praci s displejem
.org 0x1000 ;
.include "printlib.inc"

; Zacatek programu - po resetu
.org 0 ;
    jmp start

; Zacatek programu - hlavni program
.org 0x100 ;
    retez: .db "GLORY TO UKRAINE!Glory to heroes!",0 ; retezec zakonceny nulou (nikoli znakem "0")
 
start:
    ; Inicializace displeje
    call init_disp
start_withou_disp:
    ; zacatek i konec v r30 i r31
    ldi r30, low(2*retez)
    ldi r31, high(2*retez)
    
    ; aktuakni pocet pisem (bude ++)
    ldi r28, 1
    ; aktualni pozice na displee (bude --)
    ldi r29, 0x4f
    
    ; maximalni pocet pisem
    ldi r26, 32
    ; minimalni pozice
    ldi r27, 0x00
    
    ; pocet pisem, ktera majy byt vynechana (skip parametr)
    ldi r25, 0
    
    ldi r24, 0x30
    ldi r23, 0x10
    ldi r22, 0x3F
    
MAKE_MOVE:
    ldi r30, low(2*retez)
    ldi r31, high(2*retez)
    mov r18, r28
    mov r17, r29
    
    ; if skip != 0
    CPSE r25, r27
    call skip_start
    
    while:
	CPSE r17, r23
	SUBI r17, 0x30
	ADD r17, r24
    
	lpm r16, Z+
	
	; if r16 = 0 => r16 = ' '
	cpi r16, 0
	BRNE ok_char
	ldi r16, ' '
	call show_char
	ldi r16, 0
	jmp end_while
	ok_char:
	call show_char
	
	inc r17
	dec r18
	
	cpi r16, 0
	breq end_while
	cpi r18, 0
	breq end_while
	jmp while
    end_while:
    
    ; if pos == min_pos => skip++
    CPSE r29, r27
    dec r25
    inc r25
    
    ; if pos == min pos && Z == 0 => count-- max_count == count
    call check_right
    
    ; if pos != min pos => pos--
    CPSE r29, r27
    dec r29
    CPSE r29, r22
    ADD r29, r24
    SUB r29, r24
    
    ; if count != max count => count++
    CPSE r28, r26
    inc r28
    
    
    ; loop
    call sleep_time
    
    ; if count == 0 => go to start
    cpi r28, 0
    breq start_withou_disp
    jmp MAKE_MOVE
    
    end: jmp end

skip_start:
    ; while skip != 0 => Z+
    mov r19, r25
    skip:
	lpm r16, Z+
	dec r19
	CPSE r19, r27
	jmp skip
    ret
    
check_right:
    cpi r16, 0
    BRNE end_check
    mov r26, r28
    cp r29, r27
    BRNE end_check
    dec r28
    mov r26, r28
    end_check:
    ret

sleep_time:
    ldi r16, 30;1
    wait0:
    ldi r20, 255;140
    wait1:
        ldi r21, 255
    wait2:
        dec r21
        cpi r21, 0
        brne wait2
    dec r20
    cpi r20, 0
    brne wait1
    dec r16
    cpi r16, 0
    brne wait0
    ret