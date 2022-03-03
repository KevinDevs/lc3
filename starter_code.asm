.orig x3000
;this stack lab computes the polish notation of a set of calls

LD R6, STACK_ADDR
;push_val(4) pushes the value 4 onto the stack [4]
ADD R4, R4, #4
LD R5, PUSH_VAL_ADDR
JSRR R5

;push_val(3) pushes the value 3 onto the stack [4,3]
AND R4, R4, #0
ADD R4, R4, #3
LD R5, PUSH_VAL_ADDR
JSRR R5

;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R4, R4, #0
ADD R4, R4, #2
LD R5, PUSH_VAL_ADDR
JSRR R5


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R5, ADD_VAL_ADDR
JSRR R5


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]

LD R5, ADD_VAL_ADDR
JSRR R5


;move the top value of the stack into r4
LDR R4, R6, #0 ;store val in r4

HALT
;local data
STACK_ADDR .FILL xFE00
PUSH_VAL_ADDR .FILL x3400
ADD_VAL_ADDR .FILL x3800
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

ADD R6, R6, #-1
STR R4, R6, #0
RET



.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

ADD R3, R3, x0 ;remove register

LDR R1, R6, #0 ;store val in r1
STR R3, R6, #0 ;pop curr register
ADD R6, R6, #1 ;moveon

LDR R2, R6, #0 ;store val in r2
STR R3, R6, #0 ;pop curr register
ADD R6, R6, #1 ;moveon

AND R4, R4, #0 ;clear R4
ADD R4, R1, R2 ;add
ADD R6, R6, #-1 ;go back one
STR R4, R6, #0 ;store R4 to R6

RET





.end



.orig x4200 ;;data you might need

.end


