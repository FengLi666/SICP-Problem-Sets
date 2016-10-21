(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define one (cons-stream 1 one))
(define integers (cons-stream 1 (add-stream one integers)))

(define (mul-streams s1 s2)
	(stream-map-advanced * s1 s2)
)

(define factorials (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))

