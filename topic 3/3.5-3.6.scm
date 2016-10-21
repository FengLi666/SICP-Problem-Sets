;monte-carlo法估计pi值
(define (estimate-pi trails)
	(sqrt (/ 6 (monte-carlo trails cesaro-test)))
)

(define (rand) (random 100000))
(define (cesaro-test)
	(= (gcd (rand) (rand)) 1)
)

(define (monte-carlo trails experiment)
	(define (iter trails-remaining trails-passed)
		(cond 									
			((= trails-remaining 0) (/ trails-passed trails))
			((experiment) (iter (- trails-remaining 1) (+ trails-passed 1)))
			(else (iter (- trails-remaining 1) trails-passed))
		)
	)
	(iter trails 0)
)

;---3.5---

(define (random-in-range high low)
	(let ((range (- high low)))
		(+ low (random range))
	)
)

(define (point-in-circle? x y r)	
	(lambda (a b)
		(>= (square r) (+ (square (- x a)) (square (- y b))))
	)
)

(define (estimate-integral p x1 x2 y1 y2 trails)
	(define (p-test)
		(let ((x (random-in-range x2 x1)) (y (random-in-range y2 y1)))
			(p x y)
		)
	)

	(define rectangle-area (* (- x2 x1) (- y2 y1)))
	(* rectangle-area (monte-carlo trails p-test))
)

(define (estimate-pi trails)
	(define p1 (point-in-circle? 5.0 7.0 3.0))
	(/ (estimate-integral p1 2.0 8 4.0 10 10000) 9)
)

;---3.6---

(define (rand)
	(let ((init rand-init))
		(define (dispatch option)
			(cond 
				((eq? option 'generate) (rand-update init))
				((eq? option 'reset) 
					(lambda (new-value)
						((set! init new-value))
						init
					)
				)
				(else (error "incorrect option"))
			)
		)
	)
)

