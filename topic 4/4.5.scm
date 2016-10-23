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
                    (let ((test (cond-predicate first)))
                        (make-if 
                            test
                            (lambda ()  ;延时求值，避免test为假时计算出现错误
                                ((cond-actions first)
                                        test
                                )
                            )
                            (expand-clauses rest)
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
)







