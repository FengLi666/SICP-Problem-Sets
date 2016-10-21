(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (show x)
	(display-line x)
)

(define x (stream-map show (stream-enmuerate-interval 0 10)))

;(stream-ref x 5)

;1
;2
;3
;4
;5


;(stream-ref x 7)

;6
;7


