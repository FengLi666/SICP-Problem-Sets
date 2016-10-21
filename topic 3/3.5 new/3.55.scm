(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (partial-sum stream)
	(cons-stream (stream-car stream) 
		(add-streams (stream-cdr stream) (partial-sum stream))
	)
)

