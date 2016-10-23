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

        ((let? exp) (eval (let->combination exp) env))
        ((let*? exp) (eval (let*->nested-lets exp) env))

        ((for? exp) (eval (for->combination exp) env))

        ((application? exp) 
            (apply (eval (operator exp) env)    ;to-do
                (list-of-values (operands exp) env)
            )
        )
        (else (error "Unknown expression type -- EVAL" exp))
    )
)

;a for implementation
;like (for var start end body)

(define (for? exp) (tagged-list? exp))
(define (for-body exp) (cddddr exp))
(define (for-var exp) (cadr exp))
(define (for-start exp) (caddr exp))
(define (for-end exp) (cadddr exp))



(define (for->combination exp env)
	(define (xrange start end func)
		(if (< start end)
			(begin (eval (func start) env)
				(xrange (+ 1 start) end func)
			)
			'done
		)
	)
	(xrange 
		(for-start exp)
		(for-end exp)
		(make-lambda (list var)
			(for-body exp)
		)
	)
)

;a while implementation
;like (while predicate body)

(define (while? exp) (tagged? exp 'while))
(define (while-body exp) (cddr body))
(define (while-predicate exp) (cadr body))

(define (while->combination exp env)
	(define (while-helper predicate body)
		(if (eval predicate env)
			(begin (eval body env)
				(while-helper predicate env)
			)
			'done
		)
	)
	(while-helper (while-predicate exp) (while-body))
)


