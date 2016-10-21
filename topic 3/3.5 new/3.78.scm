(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (integral delay-integrand init dt)		;3.5.4
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


(define (sovle-2nd a b dt y0 dy0)
	(define y 
		(integral (delay dy) y0 dt)
	)
	(define dy 
		(integral (delay ddy) dy0 dt)
	)
	(define ddy 
		(add-streams 
			(scale-stream  dy a)
			(scale-stream  yb)
		)
	)
	y	
)


