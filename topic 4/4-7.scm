(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")


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


