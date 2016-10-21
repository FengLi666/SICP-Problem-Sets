(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.70.scm")

(define (cube x)
	(* x x x)
)

(define (weight x)
	(+ (cube (car x)) (cube (cadr x)))
)

(define s 
	(weighted-pairs integers integers
 	 	weight
	)
)
(define (ramanujan-stream pairs) 		
	(let ((current (stream-car pairs)) 
		(next (stream-car (stream-cdr pairs))))				
		(if (= (weight current) (weight next))
			(cons-stream (list current next (weight current))
				(ramanujan-stream (stream-cdr pairs))
			)
			(ramanujan-stream (stream-cdr pairs))
		)

	)
)

(define ramanujan (ramanujan-stream s))

