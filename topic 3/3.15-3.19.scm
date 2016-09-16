;---3.16---

(define (count-pairs x)
	(if (not (pair? x))
		0
		(+ (count-pairs (car x)) (count-pairs (cdr x)) 1)
	)
)
(define nil '())
(define p3 (cons 'a nil))
(define p2 (cons p3 nil))
(define p1 (cons p2 p3))

;p1 (cons (cons (cons 'a nil)) (cons 'a nil))
;(count-pairs p1)

;what the fuck?! i can't undrestand all the solution one the net 
;in my view ,this script shall only to compute the number of cons-structure in a 
;list or a tuple , and it accutually did it 
;i count every solution's nums of cons-structure , 
;the result is correct,isn't it?

;傻逼了。。cons-structure is comput as pointer..

;---3.17---

(define (count-pairs x)
	(let ((encountered '()))
		(define (counts l)
			(if (or (not (pair? l)) (memq l encountered))
				0
				(begin (set! encountered (cons l encountered)) 
					(+ (counts (car l)) (counts (cdr l)) 1))
			)
		)
		(counts x)
	)
)

;---3.18---

(define (make-circle x)
	(set-cdr! (last-pair x) x)
	x
)

(define (cycle? x) 
   (define visited nil) 
   (define (iter x) 
        (set! visited (cons x visited)) 
        (cond 
        	((null? (cdr x)) false)
            ((memq (cdr x) visited)  
            	true) 
            (else (iter (cdr x)))
        )
    ) 
    (iter x)
)  

;---3.19---

(define (safe-cdr x)
	(if (not (pair? x)) 
		'()
		(cdr x)
	)
)

(define (cycle? lst)	;---Robert Floyd method ....
	(define (iter a b)
		(cond 
			((not (pair? a)) false)
			((not (pair? b)) false)
			((eq? a b) true)
			(else (iter (safe-cdr a) (safe-cdr (safe-cdr b))))
		)
	)
	(iter (safe-cdr lst) (safe-cdr (safe-cdr lst)))
)



