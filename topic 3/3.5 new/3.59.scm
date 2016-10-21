(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (integrate-series stream)
	(mul-streams stream 
		(stream-map (lambda (x) (/ 1 x)) integers)
	)
)

(define exp-series (cons-stream 1 (integrate-series exp-series)))

(define cosine-series 
	(cons-stream 1 (integrate-series (scale-stream sine-series -1)))
)

(define sine-series
	(cons-stream 0 (integrate-series cosine-series))
)

