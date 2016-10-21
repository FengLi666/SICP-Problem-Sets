(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

; orignal no acclerate

(define (ln2-summands n)
	(cons-stream (/ 1.0 n)
		(stream-map - (ln2-summands (+ n 1)))
	)
)

(define ln2 (partial-sum (ln2-summands 1)))

; Euler!

(define (euler-transform s)
	(let ((s0 (stream-ref s 0)) (s1 (stream-ref s 1)) (s2 (stream-ref s 2)))
		(cons-stream 
			(- s2 (/ (square (- s2 s1)) (+ s0 (* -2 s1) s2)))
			(euler-transform (stream-cdr s))
		)
	)
)

(define ln2-a (euler-transform ln2))

;great Euler!

(define (make-tableau transform s)
	(cons-stream s 
		(make-tableau transform (transform s))
	)
)

(define (acclerate-sequence transform s)
	(stream-map stream-car (make-tableau transform s))
)

(define (great-euler-transform s) 
	(acclerate-sequence euler-transform s)
)

(define ln2-ga (great-euler-transform ln2))

