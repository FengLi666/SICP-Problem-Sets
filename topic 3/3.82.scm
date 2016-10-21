(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (random-in-range high low)
	(let ((range (- high low)))
		(+ low (random range))
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

(define (map-successive-pairs f stream)
	(cons-stream
		(f (stream-car stream ))
		(map-successive-pairs f 
			(stream-cdr (stream-cdr stream))
		)
	)
)

(define (make-point x y) (cons x y))
(define (point-x point) (car point))
(define (point-y point) (cdr point))
(define (point-in-circle? x y r)	
	(lambda (a b)
		(>= (square r) (+ (square (- x a)) (square (- y b))))
	)
)


(define (rand-point-stream-in-rectangle left right)
	(cons-stream 
		(make-point (random-in-range (point-x left) (point-x right))
			(random-in-range (point-y left) (point-y right))
		)
		(rand-point-stream-in-rectangle left right)
	)
)

(define cesaro-stream 
	(map-successive-pairs 
		(lambda (x)
			((point-in-circle? 5.0 7.0 3.0) (point-x x) (point-y x))
		)
		(rand-point-stream-in-rectangle (make-point 8.0 10.0) (make-point 2.0 4.0))
	)
)

(define pi 
	(stream-map 
		(lambda (x)
			(/ (* 36.0 x) (square 3.0))
		)
		(monte-carlo cesaro-stream 0 0)
	)
)

;有bug，以后再说吧....
;update after 5 min ... fix a bug...run correctly





