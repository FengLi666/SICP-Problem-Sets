
(define (stream-map-advanced proc . streams)
	(if (stream-null? (car streams))
		the-empty-stream
		(stream-cons
			(apply proc (map stream-car streams))
			(apply stream-map 
				(cons proc (map stream-cdr streams))
			)
		)
	)
)
