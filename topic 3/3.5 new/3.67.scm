(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (interleave s1 s2)
	(if (stream-null? s1) 
		s2 
		(cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))
	)
)

(define (all-pairs s t)
	(cons-stream 
		(list (stream-car s) (stream-car t))
		(interleave 			
			(interleave
				(stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
				(all-pairs (stream-cdr s) (stream-cdr t))							
			)
			(stream-map (lambda (x) (list (stream-car t) x)) (stream-cdr s))			
		)
	)
)


