org 100h    

include "emu8086.inc"
jmp start
x dw ?
y dw ?
m dw 2
c dw 5
prompt dw "Enter a value of x: ", "$"   

; response prompts
res1 db "Using m = ", "$"
res2 db " and c = ", "$"

res3 db "When x = ", "$"
res4 db ", of y = ", "$"

invalid_prompt db 0xa, 0xd, "The value of x should be between 0 and 100", 0xa, 0xd, "$"
 

start:
    mov DX, offset prompt
    mov AH, 09
    int 21h
   
    call scan_num            ; +++ scanned number stored in CX
    mov x, CX                
    putc 10
    putc 13     


    mov BX, x
    ; check_if_valid ; Ensure 0 < x < 100
    
    cmp BX, 0
    jl invalid_entry
    
    cmp BX, 100
    jg invalid_entry 

    mov AX, m                 ; 
    mul x   

    ; ADD
    add AX,c
    mov y, AX


    ; Print the response:
    ; Using m = %d and c = %d \n When x = %d, of y = %d”

    mov DX, offset res1   ; m
    call prt_str

    mov AX, m
    call print_num

    mov DX, offset res2   ; c
    call prt_str   

    mov AX, c
    call print_num

    putc 0xa
    putc 0xd

    mov DX, offset res3   ; x
    call prt_str

    mov AX, x
    call print_num                   
                   
    mov DX, offset res4    ; y
    call prt_str 
    
    mov AX, y
    call print_num

    putc 0xa
    putc 0xd   ; End of response print

    jmp exit

    ; Prints string value in DX
    prt_str  proc
        mov AH, 09
        int 21h
        ret
    prt_str endp  
                
; Print illegal prompt for values of
; x outside the margin 0 < x < 100                

invalid_entry:
    mov DX, offset invalid_prompt
    mov AH, 09
    int 21h
    
    jmp exit

exit:
    ret 
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

    end
