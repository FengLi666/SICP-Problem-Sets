(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.5 new/lab.scm")

(define (rand-update x)
  (let ((a (expt 2 32))
        (c 1103515245)
        (m 12345))
    (modulo (+ (* a x) c) m)))


(define random-init 137)
(define (random-numbers seed s-in)
  	(define (action x m)
    	(cond ((eq? m 'generate) (rand-update x))
        	  (else m)
      	)
	)
  	(define helper 
	  	(cons-stream 
	    	seed
	    	(stream-map action helper s-in)
		)
  	)
  	helper
)

(define cmds
	(cons-stream 'generate 
	   (cons-stream 137
	                (cons-stream 'generate
	                             (cons-stream 'generate '()))))
)