(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.53-3.62.scm")
(define (sqrt-improve guess x)
	(/ (+ guess (/ x guess)) 2)
)
;3.63

(define (sqrt-stream x)
	(define guesses 
		(cons-stream 1
			(stream-map (lambda (guess) (sqrt-improve guess x)) guesses)
		)
	)
	guesses
)

(define (louis-sqrt-stream x)
	(cons-stream 1
		(stream-map (lambda (guess) (sqrt-improve guess x)) (louis-sqrt-stream x))
	)
)

;.....又涉及到记忆性了，还是不理解是怎么实现的

;3.64

(define (stream-limit s limit)
	(define (iter s last limit)
		(let ((current (stream-car s)))
			(cond 
				((< (abs (- current last)) limit) current)
				(else (iter (stream-cdr s) current limit))
			)
		)
	)
	(iter (stream-cdr s) (stream-car s) limit)
)

(define (sqrt x tolerance)
	(stream-limit (sqrt-stream x) tolerance)
)

;compute pi

(define (pi-summands n)
	(cons-stream (/ 1.0 n)
		(stream-map - (pi-summands (+ n 2)))
	)
)

(define pi-stream
	(scale-stream (partial-sums (pi-summands 1)) 4)
)

(define (pi tolerance)
	(stream-limit pi-stream tolerance)
)

;欧拉加速器

(define (euler-transform s)
	(let ((s0 (stream-ref s 0)) (s1 (stream-ref s 1)) (s2 (stream-ref s 2)))
		(cons-stream 
			(- s2 (/ (square (- s2 s1)) (+ s0 (* -2 s1) s2)))
			(euler-transform (stream-cdr s))
		)
	)
)

(define pi-quick-stream (euler-transform pi-stream))

(define (pi tolerance)
	(stream-limit pi-quick-stream tolerance)
)

;super euler acclerator~~

(define (make-tableau transform s)
	(cons-stream s 
		(make-tableau transform (transform s))
	)
)

(define (acclerate-seq transform s)
	(stream-map stream-car (make-tableau transform s))
)

(define pi-supper-quick-stream (acclerate-seq euler-transform pi-stream))

;3.65

;ln2=1-1/2+1/3-1/4...

(define (ln2-summands n)
	(cons-stream (/ 1.0 n)
		(stream-map - (ln2-summands (+ n 1)))
	)
)

(define ln2-stream	(partial-sums (ln2-summands 1)))

(define ln2-quick-stream (euler-transform ln2-stream))

(define ln2-supper-stream (acclerate-seq euler-transform ln2-stream))

