(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (interleave s1 s2)
	(if (stream-null? s1) 
		s2 
		(cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))
	)
)

(define (pairs s t)
	(cons-stream 
		(list (stream-car s) (stream-car t))
		(interleave 						
			(stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))			
			(pairs (stream-cdr s) (stream-cdr t))							
		)
	)
)

(define (louis-pairs s t)
	(interleave 						
		(stream-map (lambda (x) (list (stream-car t) x)) (stream-cdr s))			
		(louis-pairs (stream-cdr s) (stream-cdr t))							
	)
)


; will exceed the maximum recursion , because the next call to pairs won't 
; get a value for stream's head

