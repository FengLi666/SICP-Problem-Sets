(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define zero-crossing 
	(stream-map sign-change-detector
		sense-data
		(cons-stream 0 sense-data)
	)
)

(define (sign-change-detector current last)
	(if ( < (* current last) 0) 
		(if (< last 0)
			'+1
			'-1
		)
		0
	)
)

