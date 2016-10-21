(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

;(define (RC R C t)
;	(lambda (i v0)
;		(add-stream
;			(scale-stream i R)
;			(integral v0 (scale-stream i (/ 1 C)) dt)
;		)
;	)
;)

(define (integral delay-integrand init dt)		;3.54
	(define proc 
		(cons-stream init
			(let ((integrand (force delay-integrand)))
				(add-streams (scale-stream integrand dt)
					proc
				)
			)
		)
	)
	proc
)

(define (solve f y0 dt)
	(define y (integral (delay dy) y0 dt))
	(define dy (stream-map f y))
	y
)