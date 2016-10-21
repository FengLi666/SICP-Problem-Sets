(define (stream-ref stream n)
	(if (= n 0)
		(stream-car stream)
		(stream-ref (stream-cdr stream )(- n 1))
	)
)

(define (stream-for-each proc stream)
	(if (stream-null? stream)
		'done
		(begin (proc (stream-car stream))
			(stream-for-each proc (stream-cdr stream))
		)
	)
)

(define (display-line x)
	(newline)
	(display x)
)
(define (display-stream s limit)	
	(define (iter n)
		(if (> n limit)
			'done
			(begin (display-line (stream-ref s n))
				(iter (+ n 1))
			)
		)
	)
	(iter 0)
)

(define (stream-filter pred stream)
	(cond 
		((stream-null? stream) the-empty-stream)
		((pred (stream-car stream))
			(cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))
		)
		(else (stream-filter pred (stream-cdr stream)))
	)
)

(define (stream-map-advanced proc . streams)
	(if (stream-null? (car streams))
		the-empty-stream
		(cons-stream
			(apply proc (map stream-car streams))
			(apply stream-map-advanced
				(cons proc (map stream-cdr streams))
			)
		)
	)
)

(define (stream-enmuerate-interval low high)
	(if (> low high)
		the-empty-stream
		(cons-stream low 
			(stream-enmuerate-interval (+ low 1) high)
		)
	)
)

(define (add-streams s1 s2)
	(stream-map-advanced + s1 s2)
)


(define one (cons-stream 1 one))
(define integers (cons-stream 1 (add-streams one integers)))

(define (mul-streams s1 s2)
	(stream-map-advanced * s1 s2)
)

(define (stream-merge s1 s2)
	(cond 
		((null? s1) s2)
		((null? s2) s1)
		(else 
			(let ((scar1 (stream-car s1)) (scar2 (stream-car s2)))
				(cond 
					((> scar1 scar2) 
						(cons-stream scar2 (merge s1 (stream-cdr s2)))
					)
					((> scar2 scar1)
						(cons-stream scar1 (merge s2 (stream-cdr s1)))						
					)
					(else 
						(cons-stream scar1 
							(merge (stream-cdr s1) (stream-cdr s2)))
					)
				)
			)
		)
	)
)

(define (scale-stream stream factor)
	(stream-map (lambda (x) (* x factor)) stream)
)


(define (partial-sum stream)
	(cons-stream (stream-car stream) 
		(add-streams (stream-cdr stream) (partial-sum stream))
	)
)

(define (average a b)
	(/ (+ a b) 2)
)

