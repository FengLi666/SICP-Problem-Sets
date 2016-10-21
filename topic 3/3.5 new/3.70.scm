(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.69.scm")

(define (merge-weighted s1 s2 weight)
	(cond 
		((stream-null? s1) s2)
		((stream-null? s2) s1)
		(else 
			(let 
				((scar1 (stream-car s1)) (scar2 (stream-car s2)))
				(cond 
					((<= (weight scar1 ) (weight scar2))
						(cons-stream scar1
							(merge-weighted (stream-cdr s1) s2 weight)
						)
					)
					(else
						(cons-stream scar2
							(merge-weighted (stream-cdr s2) s1 weight)
						)
					)					
				)
			)
		)
	)
)

(define (weighted-pairs s1 s2 weight)
    (cons-stream (list (stream-car s1) (stream-car s2))
        (merge-weighted 
        	(stream-map (lambda (x) (list (stream-car s1) x))
               (stream-cdr s2))
        	(weighted-pairs (stream-cdr s1) (stream-cdr s2) weight)
			weight
        )
    )
)
(define integers-pairs-a
	(weighted-pairs integers integers
		(lambda (x) (+ (car x) (cadr x)))
	)
)

(define integers-pairs-b
	(weighted-pairs integers integers
		(lambda (x)			
			(let 
				((i (car x)) (j (cadr x)))
				(define help?
					(or (= (remainder (* i j) 2) 0)
						(= (remainder (* i j) 3) 0)
						(= (remainder (* i j) 5) 0)
					)
				)
				(if help?
					(+ (* 2 i) (* 3 j) (* 5 i j))
					0
				)
			)
		)
	)
)

;(1 1)
;(1 2)
;(1 3)
;(2 2)
;(1 4)
;(1 5)
;(2 3)
;(1 6)
;(1 7)
;(2 4)
;(3 3)
;(1 8)
;(2 5)
;(1 9)
;(3 4)
;(1 10)
;(1 11)
;(2 7)
;(3 5)
;(1 12)
;(1 13)
;  还是有不能被整除的数对啊？