(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (stream-limit stream tolerance)
	(let ((scar (stream-car stream)) (scadr (stream-car (stream-cdr stream))))
		(cond 
			((> tolerance (abs (- scar scadr))) scadr)
			(else (stream-limit (stream-cdr stream) tolerance))
		)
	)
)

(define (sqrt x tolerance)
	(stream-limit (sqrt-stream x) tolerance)	
)

(define (sqrt-stream x)
	(define guesses
		(cons-stream 1.0
			(stream-map (lambda (guess) (sqrt-improve guess x)) guesses)
		)
	)
	guesses
)

(define (sqrt-improve guess x)
	(define (average a b) (/ (+ a b) 2.0))
	(average guess (/ x guess))
)



