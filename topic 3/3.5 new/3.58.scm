(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (expand num den radix)
	(cons-stream 
		(quotient (* num radix) den)
		(expand (remainder (* num radix) den) den radix)
	)
)

;this is a function to compute float-div
; radix is garrison

