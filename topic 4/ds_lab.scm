(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")

;true and false
(define (true? x)
	(not (false? x))
)

(define (false? x)
	(eq? x false)	
)

;假定已有基本过程
;(apply-primitive-procedure <proc> <args>)
;(primitive-procedure? <proc>)

;composed procedure 
(define (make-procedure parameters body env) (list 'procedure parameters body env))
(define (compound-procedure? p) (tagged-list? p 'procedure))
(define (procedure-parameters p) (cadr p))
(define (procedure-body p) (caddr p))
(define (procedure-env p) (cadddr p))

;(lookup-variable-value <var> <env>)
;returns the value that is bound to the symbol <var> in the environment <env>, or signals an error if the variable is unbound.

;(extend-environment <variables> <values> <base-env>)
;returns a new environment, consisting of a new frame in which the symbols in the list 
;<variables> are bound to the corresponding elements in the list <values>, where the enclosing environment is the environment <base-env>.

;(define-variable! <var> <value> <env>)
;adds to the first frame in the environment <env> a new binding that associates the variable <var> with the value <value>.

;(set-variable-value! <var> <value> <env>)
;changes the binding of the variable <var> in the environment <env> so that the variable is now bound to the value <value>, or signals an error if the variable is unbound.