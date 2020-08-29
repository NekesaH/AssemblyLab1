call scan_num            ; +++ scanned number stored in CX
mov x, CX                
putc 10
putc 13

mov AX, m                 ; 
mul x 
; ADD
add AX,c