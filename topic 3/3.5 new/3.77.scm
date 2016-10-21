(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (integral integrand init dt)
	(cons-stream init
		(if (stream-null? integrand)
			the-empty-stream
			(integral 
				(stream-cdr integrand)
				(+ init (* (stream-car integrand) dt))
				dt
			)
		)
	)
)
;delay mode

(define (integral delay-integrand init dt)
	(cons-stream init
		(let ((integrand (force delay-integrand)))
			(if (stream-null? integrand)
				the-empty-stream
				(integral
					(delay (stream-cdr integrand))
					(+ init (* (stream-car integrand) dt))
					dt
				)
			)
		)
	)
)


(define (solve f y0 dt)
	(define y (integral (delay dy) y0 dt))
	(define dy (stream-map f y))
	y
)

