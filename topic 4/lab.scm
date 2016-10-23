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

;------------------- 基本过程（上面也是)

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

(define (make-define variable value) 
    (list 'define varible value)
)

(define (eval-if exp env)
    (if (true? (eval (if-predicate exp) env))
        (eval (if-consequent exp) env)
        (eval (if-alternative exp) env)
    )
)

(define (eval-sequence exps env)
    (cond 
        ((last-exp? exps) (eval (first-exp exps) env))
        (else
            (eval (first-exp exps) env)
            (eval-sequence (rest-exps exps) env)
        )
    )
)

(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (cons (eval (first-exp exps) env)
            (list-of-values (rest-exps exps) env)
        )
    )
)

;----------------谓词和选择函数和构造函数

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

(define (quoted? exp)
    (tagged-list? exp 'quote)
)

(define (text-of-quotation exp) (cadr exp))

(define (tagged-list? exp tag)
    (if (pair? exp)
        (eq? (car exp) tag)
        (false)
    )
)

(define (assignment? exp)
    (tagged-list? exp 'set!)
)

(define (assignment-variable exp) (cadr exp))
(define (assignment-value exp) (caddr exp))

(define (definition? exp)
    (tagged-list? exp 'define)
)

(define (definition-varible exp)
    (if (symbol? (cadr exp))
        (cadr exp)
        (caadr exp)
    )
)

(define (definition-value exp)
    (if (symbol? (cadr exp))
        (caddr exp)
        (make-lambda (cdadr exp)
            (cddr exp)
        )
    )
)

(define (lambda? exp)
    (tagged-list? exp 'lambda)
)

(define (lambda-parameters exp)
    (cadr exp)
)

(define (lambda-body exp)
    (cddr exp)
)

(define (make-lambda parameters body)
    (cons 'lambda (cons parameters body))   ;why not use list?
)

(define (if? exp) (tagged-list? 'if))

(define (if-predicate exp) (cadr exp))
(define (if-consequent exp) (caddr exp))
(define (if-alternative exp)
    (if (not (null? (cdddr exp)))
        (cadddr exp)
        'false
    )
)

(define (make-if predicate consequent alternative)
    (list 'if predicate consequent alternative)
)

(define (begin? exp)
    (tagged-list? exp 'begin)
)

(define (begin-actions exp) (cdr exp))
(define (last-exp? seq ) (null? (cdr seq)))
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
    (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))
    )
)

(define (make-begin seq) (cons 'begin seq))

(define (application? exp) (pair? exp))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (no-operands> ops) (null? ops))
(define (first-operands ops) (car ops))
(define (rest-operands ops) (cdr ops))


(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))

(define (cond-else-clause? clause)
    (eq? (cond-predicate clause) 'else)
)
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))

(define (cond->if exp)
    (expand-clauses (cond-clauses exp))
)

(define (expand-clauses clauses)
    (if (null? clauses)
        'false
        (let ((first (car clauses))
            (rest (cdr clauses)))

            (if (cond-else-clause? first)
                (if (null? rest)
                    (sequence->exp (cond-actions first))
                    (error "ELSE clause if not last --  COND->IF" 
                        clauses 
                    )
                )
                (make-if 
                    (cond-predicate first)
                    (sequence->exp (cond-actions first))
                    (expand-clauses rest)
                )
            )
        )
    )
)

