org 100h

x dw ?
y dw ?
m dw 2
c dw 5
 

start:
print 'Enter a value of x '
   
call scan_num            ; +++ scanned number stored in CX
mov x, CX                
putc 10
putc 13

mov AX, m                 ; 
mul x 
; ADD
add AX,c

print ", of y= "
call print_num 

ret 

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

end
