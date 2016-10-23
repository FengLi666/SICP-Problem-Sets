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

        ((application? exp) 
            (apply (eval (operator exp) env)    ;to-do
                (list-of-values (operands exp) env)
            )
        )
        (else (error "Unknown expression type -- EVAL" exp))
    )
)

(define (let-body exp) (cddr exp))
(define (let-list exp) (cadr exp))
(define (let-vars exp) (map car (let-list exp)))
(define (let-exps exp) (map cadr (let-list exp)))

(define (let*->nested-lets exp)
    (let ((len (length let-list)))
        (cond 
            ((= 0 len) (error "THE LET-VARS-LIST IS EMPTY!" exp))
            ((= 1 len) (make-let (let-body exp) (let-list exp)))
            (else 
                (make-let 
                    (let*->nested-lets 
                        (make-let* 
                            (let-body exp)
                            (cdr (let-list exp))
                        )                        
                    )
                    (list (car (let-list exp)))
                )
            )
        )
    )
)


