(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/ds_lab.scm")

(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environmen '())


(define (make-frame vars vals) 
	(map cons vars vals)
)
(define (frame-variables frame) (map car frame))
(define (frame-values frame) (map cdr frame))

(define (first-binds binds) (car binds))
(define (other-binds) (cdr binds))
(define (add-binding-to-frame! var val frame) (set! frame (cons (make-bind var val) frame)))

(define (make-bind var val) (cons var val))
(define (bind-var bind) (car bind))
(define (bind-val bind ) (cdr bind))




(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))	


(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan binds)
    	(cond 
    		((null? binds) (env-loop (enclosing-environment env)))
    		((eq? (bind-var (car binds)) var) (bind-var (car binds)))
    		(else (scan (cdr binds)))
    	)
    )
    (if (eq? env the-empty-environment)
    	(error "unbound variable--SET!" var )
    	(scan (first-binds frame))
    )
  (env-loop env))


(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan binds)
    	(cond 
    		((null? binds) (env-loop (enclosing-environment env)))
    		((eq? (bind-var (car binds)) var) (set-car! (car binds) val))
    		(else (scan (cdr binds)))
    	)
    )
    (if (eq? env the-empty-environment)
    	(error "unbound variable--SET!" var )
    	(scan (first-binds frame))
    )
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)) (bind (make-bind var val)))
    (define (scan binds)
    	(cond 
    		((null? binds) (add-binding-to-frame bind frame))
    		((eq? var (bind-var bind)) (set-car! bind val))
    		(else (scan (cdr binds) frame))
    	)
    )
    (scan (frame-variables frame)



