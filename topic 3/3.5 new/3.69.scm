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

(define (triples s t u)
	(cons-stream 
		(list (stream-car s) (stream-car t) (stream-car u))
		(interleave
			(stream-map 
				(lambda (x) (cons (stream-car s) x))
				(pairs t u)
			)
			(triples (stream-cdr s) (stream-cdr t) (stream-cdr u))
		)
	)
)

(define phythagorean-numbers 
	(stream-filter 
		(lambda (t) 
			(= (+ (square (car t)) (square (cadr t))) 
				(square (caddr t))
			)
		)
		(triples integers integers integers)
	)
)

