(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")

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
                (if (eq? (cadr first) '=>')
                    (make-if 
                        (cond-predicate first)
                        ((cond-actions first)
                            (cond-predicate first)
                        )
                        (expand-clauses rest)
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
)








