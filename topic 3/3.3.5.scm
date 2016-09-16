;C to F

(define C (make-connector))
(define F (make-connector))

;(define (C-to-F-converter c f)
;   (let ((u (make-connector))
;            (v (make-connector))
;         (w (make-connector))
;         (x (make-connector))
;         (y (make-connector))
;       )
;           (mutiplier c w u)
;       (constant 9 w)
;       (constant 21 y)
;           (constant 5 x)
;        (mutiplier x v u)
;        (adder v y f)
;        'ok
;   )  
;)

;(prob 'C C)
;(prob 'F F)

;(set-value! C 25 'user)

;design this programe

(define (adder a b sum)
    (define (process-new-value)
        (cond
            ((and (has-value a) (has-value b))
                (set-value! sum (+ (get-value a) (get-value b)) me)                 
            )
            ((and (has-value a) (has-value sum))
                (set-value! b (- (get-value sum) (get-value a)) me)
            )
            ((and (has-value b) (has-value sum))
                (set-value! a (- (get-value sum) (get-value b)) me)
            )                    
        )
    )    
    (define (process-forget-value)
        (forget-value! sum me)        
        (forget-value! a me)
        (forget-value b me)
        (process-new-value)
    )        
    (define (me request)
        (cond 
            ((eq? request 'i-have-a-value)
                (process-new-value) 
            )  
            ((eq? request 'i-lost-a-value) 
                (process-forget-value) 
            )
            (else (error "UNKNOWN REQUEST"))
        )
    )
    (connect a me)
    (connect b me)
    (connect sum me)
    me
)


(define (mutiplier a b product)
    (define (process-new-value)
        
        ;......
    )    
    (define (process-forget-value)
        (forget-value! product me)        
        (forget-value! a me)
        (forget-value b me)
        (process-new-value)
    )        
    (define (me request)
        (cond 
            ((eq? request 'i-have-a-value)
                (process-new-value) 
            )  
            ((eq? request 'i-lost-a-value) 
                (process-forget-value) 
            )
            (else (error "UNKNOWN REQUEST"))
        )
    )
    (connect a me)
    (connect b me)
    (connect sum me)
    me
)


(define (inform-of-value constraint) 
    (constraint 'i-have-a-value)
)
(define (inform-of-no-value constraint) 
    (constraint 'i-lost-a-value)
)

(define (make-connector)
    (let ((value false) (informant false) (constraints '()))
        (define (set-my-value new-value setter)
            (cond 
                ((not value) (set! value new-value) (set! informant setter) 
                    (for-each-expect setter inform-of-value constraints) 
                )  
                ((not (= value new-value) )(error "contradiction" (list value new-value)))
                (else 'ignored)
            )
        )
        (define (forget-my-value retractor)
            (if (eq? retractor informant)
                (begin (set! value false)
                    (for-each-expect retractor inform-of-no-value constraints)  
                )    
                'ignored
            )  
        )
        (define (connect new-constraint)
            (if (not (memq new-constraint constraints))
                (set! constraints (cons new-constraint constraints))    
            )  
            (if value (inform-of-value new-constraint))
        )
        (define (me request)
            (cond 
                ((eq? request 'has-value)
                (if value true false))
                ((eq? request 'value ) value)
                ((eq? request 'set-value) set-my-value)
                ((eq? request 'forget)  forget-my-value)
                ((eq? request connect) connect)
                (else (error "UNKNOWN OPERATION" request))
                
            )              
        )
        me
    )    
) 

(define (for-each-expect exception procedure list)
    (define (loop items)
        (cond 
            ((null? items) 'done)
            ((eq? exception (car items)) (loop (cdr items)))
            (else (procedure (car items)) (loop (cdr items))  
        )  
    )  
    (loop list)
)

    
(define (has-value? connector) (connector 'has-value))
(define (set-value! connector value informant)    ((connector 'set-value) value informant))


;---3.33---

(define (averager a b c)
    (let ((sum (make-connector)) (div (make-connector)))
        (adder a b sum)  
        (constant div 2)
        (mutiplier div c sum)
    )    
)

;---3.34---
(define (squarer a b)   ;with this method , give A we will know B , but with B given we can't get A
    (mutiplier a a b)  
)

;---3.35---

(define (squarer a b)
    (define (process-new-value)
        (if (has-value a)
            (set-value! b (square a) me)
            (if (> (get-value b) 0)
                (set-value! a (sqrt b) me)
                (error "square < 0" b)    
            )    
        )  
    )  
    (define (process-forget-value)
        (forget-value! a)
        (forget-value! b)
        (process-new-value)
    )
    (define (me request)
            (cond 
                ((eq? request 'i-have-a-value)
                    (process-new-value) 
                )  
                ((eq? request 'i-lost-a-value) 
                    (process-forget-value) 
                )
                (else (error "UNKNOWN REQUEST"))
            )
        )
    (connect a me)
    (connect b me)
    me
)

;---3.37---
(define (c+ x y) 
   (let ((z (make-connector))) 
     (adder x y z) 
     z)) 
  
 (define (c- x y) 
   (let ((z (make-connector))) 
     (adder z y x) 
     z)) 
  
 (define (c* x y) 
   (let ((z (make-connector))) 
     (multiplier x y z) 
     z)) 
  
 (define (c/ x y) 
   (let ((z (make-connector))) 
     (multiplier z y x) 
     z)) 
  
 (define (cv x) 
   (let ((z (make-connector))) 
     (constant x z) 
     z)) 
  
 (define (celsius-fahrenheit-converter x) 
   (c+ (c* (c/ (cv 9) (cv 5)) 
           x) 
       (cv 32))) 
;	9c=5(f-32)	f=9/5c+32 	c=5/9(f-32)

(define (fahrenheit-celsius-converter x)
	(c* (c* (cv 5/9) (c+ f (cv -32))))
)

