(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")
(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/ds_lab.scm")


(define (action-on-varible-value var val env action alter step)
	(define (env-loop env)
	  (define (scan vars vals)
	    (cond ((null? vars)
	          	(if (eq? step 'continue)
	          		(env-loop (enclosing-environment env))
	          		(env-loop (the-empty-environment))
	          	) 
	          )
	          ((eq? var (car vars))
	           (action vars vals)
	       	)
	          (else (scan (cdr vars) (cdr vals)))))
	  (if (eq? env the-empty-environment)
	      alter
	      (let ((frame (first-frame env)))
	        (scan (frame-variables frame)
	              (frame-values frame)))))
	(env-loop env)
)

(define (set-variable-value! var val env)
	(action-on-varible-value var val env (lambda (vars vals) (set-car! vals val)) (error "Unbound variable -- SET!" var) 'continue)
)

(define (look-varible-value! var val env)
	(action-on-varible-value var val env (lambda (vars vals) ((car vals))) (error "Unbound variable -- SET!" var) 'continue)
)

;不能理解为什么是在第一个frame里寻找，难道不应该像上面一样在全局中吗？

;update
;试想在一个函数中要定义一个东西，如果本框架没有，那就直接定义了，不会向外去找，里面的是要覆盖外面的；

(define (define-varible! var val env)			
	(action-on-varible-value var val env (lambda (vars vals) (set-car! vals val)) (add-binding-to-frame var val frame) 'break)
)



