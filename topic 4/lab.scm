
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

(define (apply procedure arguments) ;a little confused
    (cond 
        ((primitive-procedure? procedure) 
            (apply-primitive-procedure procedure arguments)
        )
        ((compound-procedure? procedure)
            (eval-sequence 
                (procedure-body procedure)
                (extend-environment
                    (procedure-parameters procedure)
                    arguments
                    (procedure-environment procedure)
                )                
            )
        )
        (else (error "Unknown procedure type -- APPLY" procedure))
    )
)

;------------------- deal

(define (eval-assignment exp env)
    (set-variable-values! (assignment-variable exp)
        (eval (assignment-value exp) env)
        env
    )
    'ok
)

(define (eval-definition exp env)
    (define-variable! (definition-varible exp)
        (eval (definition-value exp) env)
        env
    )
    'ok
)

(define (eval-if exp env)
    (if (true? (eval (if-predicate exp) env))
        (eval (if-consequent exp) env)
        (eval (if-alternative exp) env)
    )
)

(define (eval-sequence exps env)
    (cond 
        ((last-exp? exps) (eval (first-exps exps) env))
        (else 
            (eval (first-exps exps) env)
            (eval-sequence (rest-exps exps) env)
        )
    )
)

(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (cons (eval (first-exps exps) env)
            (list-of-values (rest-exps exps) env)
        )
    )
)

;----------------谓词

(define (self-evaluating? exp)
    (cond 
        ((number? exp) true)
        ((string? exp) true)
        (else false)
    )
)

(define (varible? exp) 
    (symbol? exp)
)

(define )