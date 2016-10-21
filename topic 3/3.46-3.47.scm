;---3.47---

(define (make-signal-capacity)
	(let ((capacity n))
   		(define (the-signal request num)
       		(cond 
           		((eq? request 'acquire) 
              		(if (> num 0)
                    	(begin ((make-mutex) 'acquire) (the-signal request (- num 1)))
                     	(the-signal request num)
                    )
              	)
             	((eq? request 'release) (set! capacity (+ capacity 1)))
          	)       		
       	)	
     	(lambda (request) (the-signal request capacity))
   	
   	)  
)

(define (make-semaphore n)
	(let ((lock (make-mutex)))
   		(define (acquire)
       		(lock 'acquire')
         	(if (> n 0)
            	(begin (set! n (- n 1)) (mutex 'release) 'ok)
             	(begin (lock 'release) (acquire))
            )       
       	)
     	(define (release)
        	(lock 'acquire')
         	(set! n (+ n 1))
          	'ok       
          	(lock 'release)           	
        )
 		(define (dispatch m)
     		(cond 
         		((eq? m 'acquire) (acquire))
           		((eq? m 'release) (release))
             	(else (error "UNKNOWN OPERATION"))
         	)
     	)  
   	)
 	dispatch
)

;test-and-set

(define (make-semaphore n)
  	(define (test-and-set! i)
    	(if (= i 0)
         	true
          	(begin (set! n (- n 1)) 'ok)
         )
    )
	(define (acquire)
   		(if (test-and-set! (> n 0))
         	(acquire)
          'ok
        )
   	)
 	(define (release)
    	(set! n (+ n 1))
     	'ok
    )
	
	(define (dispatch m)
		(cond 
	 		((eq? m 'acquire) (acquire))
	   		((eq? m 'release) (release))
	     	(else (error "UNKNOWN OPERATION"))
 		)
	)  
 	dispatch
)

;对于时间片模型的MIT SCHEME test-and-set! 的实现可以为

(define (test-and-set! cell)    ;just basic
    (without-interrupts
        (lambda ()
            (if (car cell)
                true
                (begin (set-car! cell true) false)    
            )  
        )  
    )  
)

