(load "/Users/fengli/Desktop/SICP Problem Sets/topic 4/lab.scm")

(define (list-of-values exps env)	;left to right
	(let ((first (eval (first-exps exps) env)))
		(cons first
			(list-of-values (rest-exps exps) env)
		)
	)
)

(define (list-of-values exps env)	 ;right to left
	(let ((rest (rest-exps exps)))
		(cons (eval (first-exps exps) env)
			rest
		)
	)
)


