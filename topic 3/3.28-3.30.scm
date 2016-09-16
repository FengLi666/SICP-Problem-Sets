;---3.28---
(define (or-gate a1 a2 ouput)
	(define (or-gate-procedure)
		(let ((new-value (logical-or (get-signal a1) (get-signal a2))))
			(after-delay or-gate-dalay
				(lambda () 
					(set-signal! ouput new-value)
				)
			)
		)
	)
	(add-action! a1 or-gate-procedure)
	(add-action! a2 or-gate-procedure)
	'ok	
)

(define (logical-or s1 s2)
	(cond 
		((= s1 1) 1)
		((= s2 1) 1)
		(else 0)
	)
)

;---3.29---(or a b) == (not ((not a) and (not b)))

;(define (or-gate a1 a2 ouput)
;	(let ((b (make-wire)) (c (make-wire)) (d (make-wire)))
;		(inverter a1 b)
;		(inverter a2 c)
;		(and-gate b c d)
;		(inverter d output)
;	)
;)

;---3.30---
	;一个需要点智慧的递归下降方法
(define (ripple-carry-adder a b s c) 
   (let ((c-in (make-wire))) 
         (if (null? (cdr a))
           (set-signal! c-in 0) 
           (ripple-carry-adder (cdr a) (cdr b) (cdr s) c-in)) 
         (full-adder (car a) (car b) c-in (car s) c))) 

