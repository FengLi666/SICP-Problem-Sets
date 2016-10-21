(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (stream-merge s1 s2)
	(cond 
		((null? s1) s2)
		((null? s2) s1)
		(else 
			(let ((scar1 (stream-car s1)) (scar2 (stream-car s2)))
				(cond 
					((> scar1 scar2) 
						(cons-stream scar2 (stream-merge s1 (stream-cdr s2)))
					)
					((> scar2 scar1)
						(cons-stream scar1 (stream-merge s2 (stream-cdr s1)))						
					)
					(else 
						(cons-stream scar1 
							(stream-merge (stream-cdr s1) (stream-cdr s2)))
					)
				)
			)
		)
	)
)

(define s (cons-stream 1 (stream-merge (scale-stream s 2) 
	(stream-merge (scale-stream s 3) (scale-stream s 5))))
)

