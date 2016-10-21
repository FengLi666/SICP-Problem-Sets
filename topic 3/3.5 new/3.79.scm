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

;忘了这种方程怎么解了（其实原本就不会）
(define (sovle-2nd f y0 dy0 dt)
	(define y 
		(integral (delay dy) y0 dt)
	)
	(define dy 
		(integral (delay ddy) dy0 dt)
	)
	(define ddy 
		(map (stream-map-advanced f y dy))
	)
	y	
)


