;---3.7---

(load "/Users/fengli/Desktop/SICP Problem Sets/topic 3/3.1-3.4.scm")

(define (make-joint name password another-password)
	(lambda (act message)
		(if (eq? message another-password)
			(name act password)
			(name act error)
		)
	)
)

;---3.8---

(define (f n)
	(let ((called? false))
		(if called?
			0
			(begin (set! called true) n)
		)
	)
)