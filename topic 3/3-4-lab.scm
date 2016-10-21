
(define the-empty-stream '())
(define (stream-filter pred stream)
	(cond 
		((stream-empty? stream) the-empty-stream)
		((pred (stream-car stream))
			(cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
		)
		(else (stream-filter pred (stream-cdr stream)))
	)
)

(define (stream-empty? stream) (null? stream))


(define (stream-enumerate-interval low high)
	(if (> low high)
		'()
		(cons-stream low (stream-enumerate-interval (+ low 1) high))
	)
)

(define (display-line x)
	(newline)
	(display x)
)

(define smrf stream-ref)

(define (stream-for-each proc s max)
	(define (iter proc s cnt)
		(cond 
			((> cnt max) 'done)
			((stream-empty? s) 'the-empty-stream)
			(else (proc (stream-car s)) (iter proc (stream-cdr s) (+ 1 cnt)))
		)
	)
	(iter proc s 0)
)

(define (display-stream s max)
	(stream-for-each display-line s max)
)

(define ds display-stream)

(define (scale-stream s n)
	(stream-map (lambda (x) (* x n)) s)
)


;