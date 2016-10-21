(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3-4-lab.scm")
;;---3.50---

(define (stream-map proc . argstreams)
	(if (stream-null? (car argstreams))
		the-empty-stream
		(cons-stream
			(apply proc (map stream-car argstreams))
			(apply stream-map (cons proc (map stream-cdr argstreams)))
		)
	)		;(apply f '(a b c d)) ==  (f a b c d)
)

;---3.51--- !!!???完了完了完全不知道是怎么实现记忆的
			;唯一确定的一点就是不是书上的那个momo-proc，那个只是模型

(define (show x)
	(display-line x)
)	


;(define x (stream-map show (stream-enumerate-interval 0 10)))

;;---3.52---

;(define sum 0)
;(define (accum x)
;	(set! sum (+ sum x))
;	sum
;)
;(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;(define y (stream-filter even? seq))

