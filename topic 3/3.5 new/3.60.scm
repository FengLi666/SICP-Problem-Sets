(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/3.55.scm")

;(a0,a1...an) * (b0,b1...bn)
;==a0*b0+a0*(b1...bn)+b0*(a1...an)+ (a0...an)(b0...bn)

;oh shit ,there is a scary bug ,,, i have no idea to fix it ,,,

;(define (mul-series s1 s2)
;	(let ((scar1 (stream-car s1)) (scar2 (stream-car s2))
;			(scdr1 (stream-cdr s1)) (scdr2 (stream-cdr s2))
;		)

;		(cons-stream 
;			(* scar1 scar2)
;			(add-streams
;				(add-streams
;					(scale-stream scdr1 scar2)
;					(scale-stream scdr2 scar1)
;				)
;				(cons-stream 0 (mul-series scdr1 scdr2))
;			)
;		)
;	)
;)


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
