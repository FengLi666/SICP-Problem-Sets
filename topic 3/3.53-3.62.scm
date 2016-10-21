(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5.1.scm")
(define (add-streams a b)
	(stream-map + a b)
)
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams integers ones)))

;3.53

(define s (cons-stream 1 (add-streams s s))) 

;3.54

(define (mul-streams a b)
	(stream-map * a b)
)

(define factorials (cons-stream 1 (mul-streams factorials (stream-cdr integers))))

;3.55

(define (partial-sums stream)
	(cons-stream (stream-car stream) 
		(add-streams (stream-cdr stream) (partial-sums stream))
	)
)

(define (partial-sums stream)
	(add-streams stream (cons-stream 0 (partial-sums stream)))
)

;3.56

(define (merge s1 s2)
	(cond 
		((stream-empty? s1) s2)
		((stream-empty? s2) s1)
		(else 
			(let ((scar1 (stream-car s1)) (scar2 (stream-car s2)))
				(cond 
					((< scar1 scar2) 
						(cons-stream scar1 (merge (stream-cdr s1) s2))
					)
					((> scar1 scar2)
						(cons-stream scar2 (merge (stream-cdr s2) s1))
					)
					(else (cons-stream scar1 (merge (stream-cdr s1) (stream-cdr s2))))
				)
			)
		)
	)
)

(define (scale-integers n) (cons-stream 1 (scale-stream integers n)))

(define Hamming_list 
	(cons-stream 1 
		(merge (scale-stream hamming_list 2)
			(merge 
				(scale-stream hamming_list 3)
				(scale-stream hamming_list 5)
			)
		)
	)
)

;3.58

(define (expand num den radix)
	(cons-stream
		(quotient (* num radix) den)
		(expand (remainder (* num radix) den) den radix)
	)
)

;3.59

;a
(define (reciprocal s) 
	(stream-map (lambda (x) (/ 1 x)) s)
)
(define integers-reciprocal
	(reciprocal integers)
)
(define (integrate-series s)
	(mul-streams s integers-reciprocal)
)

;b

(define exp-series (cons-stream 1 (integrate-series exp-series)))

(define sine-series (cons-stream 0 (integrate-series cosine-series)))

(define cosine-series (cons-stream 1 (integrate-series (scale-stream sine-series -1))))

;3.60

(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2))
		(add-streams 
			(add-streams (scale-stream (stream-cdr s2) (stream-car s1))
				(scale-stream (stream-cdr s1) (stream-car s2))
			)
			(cons-stream 0 (mul-series (stream-cdr s1) (stream-cdr s2)))
		)
	)
)
;(+ a1 a2 a3 ...) * (+ b1 b2 b3)
;==a1*b1+a1*(b2+...)+b1*(a2+...)+(a2...)*(b2...)


;3.61

; xs=1
; x(1+sr)=1
; x+xsr=1
; x=1-sr*x

(define (reciprocal-series s)
	(cons-stream 1 
		(mul-series (scale-stream (stream-cdr s) -1) 
			(reciprocal-series s)
		)
	)
)
(define foo (reciprocal-series exp-series))

;3.62

(define (div-series s1 s2)
	(stream-map (lambda (x) (if (= x 0) (error "denominator is zero"))) s2)
	(let ((x2 (reciprocal-series s2)))		
		(mul-series s1 x2)
	)
)

(define tane-series (div-series sine-series cosine-series))


