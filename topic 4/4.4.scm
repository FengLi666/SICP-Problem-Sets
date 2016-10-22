(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")

(define (eval exp env)
    (cond 
        ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((and? exp) (eval-and exp env))
        ((or? exp) (eval-or exp env))
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

(define (and? exp ) (tagged-list? exp 'and))
(define (and-seq exp) (cdr exp))

(define (eval-and exp env)
	(define (helper exp)
		(cond 
			((null? exp) 'true)
			((not (eval (first-exps? exp) env)) 'false)
			(else (helper (rest-exps exp)))
		)
	)
	(let ((seq (and-seq exp)))		
		(helper seq)
	)
)


(define (or? exp) (tagged-list? exp 'or))
(define (and-seq exp) (cdr exp))

(define (eval-and exp env)
	(define (helper exp)
		(cond 
			((null? exp) 'false')
			((eval (first-exps exp) env) 'true)
			(else 
				(helper (rest-exps exp))
			)
		)
	)
	(let ((seq (or-seq exp)))
		(helper seq)
	)
)

