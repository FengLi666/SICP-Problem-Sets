(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.60.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.59.scm")

(define (reciprocal-series s)
	(cons-stream 1 
		(mul-series (scale-stream (stream-cdr s) -1) 
			(reciprocal-series s)
		)
	)
)
(define foo (reciprocal-series exp-series))

;there is a Problem that 
;	all solution i browse on net have exceeded maximum recursion depth


;update--- the error above is from the 'mul-series
;there is a bug i haven't understand

; so horrible ,,,

