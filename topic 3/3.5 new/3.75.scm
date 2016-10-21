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


(define (make-zero-crossings input last last-avpt)
	(let (current-avpt (/ (+ (stream-car input) last) 2))
		(cons-stream 
			(sign-change-detector last-avpt avpt)
			(make-zero-crossings (stream-cdr input) (stream-car input) avpt)
		)
	)
)

