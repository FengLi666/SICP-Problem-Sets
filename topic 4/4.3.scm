(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")
(define (eval exp env)
    (cond 
        ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) 
            (make-procedure (lambda-parameters exp)
                (lambda-body exp)
                env
            )
        )
        ((begin? exp) (eval-sequence (begin-actions exp) env)) 
        ((cond? exp) (eval (cond->if exp) env)) 
        ((application? exp) 
            (apply (eval (operator exp) env)    ;to-do
                (list-of-values (operands exp) env)
            )
        )
        (else (error "Unknown expression type -- EVAL" exp))
    )
)

(define (eval exp env)
	(cond 
		((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((get 'eval (tag exp)) 
        	((get 'eval (tag exp)) exp env)
        )
        ((application? exp)
        	(apply (eval (operator exp) env)    ;to-do
        	    (list-of-values (operands exp) env)
        	)
        )
        (error "Unkown expression type -- EVAL" exp)
	)
)

(define (tag exp) (car exp))


(put 'eval 'quoted text-of-quotation)
(put 'eval 'set! eval-assignment)
(put 'eval 'define eval-definition)
(put 'eval 'if eval-if)
(put 'eval 'lambda 
	(lambda (exp env)
		(make-procedure (lambda-parameters exp)
		    (lambda-body exp)
		    env
		)
	)
)
(put 'eval 'begin 
	(lambda (exp env)
		(eval-sequence (begin-actions exp) env)
	)
)
(put 'eval 'cond 
	(lambda (exp env)
		(eval (cond->if exp) env)
	)
)
