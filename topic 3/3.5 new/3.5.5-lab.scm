(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (random-init) (random 10000000))

(define (rand-update x)	
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m))
)

(define random-numbers
	(cons-stream (random-init)
		(stream-map rand-update random-numbers)
	)
)


(define (map-successive-pairs f stream)
	(cons-stream
		(f (stream-car stream ) (stream-car (stream-cdr stream)))
		(map-successive-pairs f 
			(stream-cdr (stream-cdr stream))
		)
	)
)

(define cesaro-stream
	(map-successive-pairs 
		(lambda (r1 r2)
			(= 1 (gcd r1 r2))
		)
		random-numbers
	)	
)

(define (monte-carlo s passed failed)
	(define (next passed failed)
		(cons-stream
			(/ passed (+ passed failed))
			(monte-carlo (stream-cdr s) passed failed)
		)
	)
	(if (stream-car s)
		(next (+ 1 passed) failed)
		(next passed (+ failed 1))
	)
)

(define pi 
	(stream-map (lambda (x) (sqrt (/ 6 x)))
		(monte-carlo cesaro-stream 0 0)
	)
)

