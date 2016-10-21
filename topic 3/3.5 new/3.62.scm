(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.61.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.59.scm")

(define (div-series s1 s2)
	(if (= 0 (stream-car s2))
		(error "the constant of denominator is zero")
	)
	(mul-series s1 (reciprocal-series s2))
)

(define tane-series (div-series sine-series cosine-series))

