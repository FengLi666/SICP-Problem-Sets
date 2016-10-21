;---3.1---

(define (make-accumulate init)
	(lambda (num)
		(begin (set! init (+ init num)) init)
	)
)

;---3.2---

(define (make-monitored func)
	(let ((calls-num 0))
		(lambda (attr)
			(cond 				
				((eq? attr 'how-many-calls?) calls-num)
				((eq? attr 'reset-count) (set! calls-num 0) (display "reset-completed"))
				(else (set! calls-num (+ 1 calls-num)) (func attr))
			)
		)
	)
)

;---3.3 and 3.4---	;折腾了一会儿，本想用3.2的make-monitored走捷径，却没想出，不知道能不能

(define (make-account balance password)
	(define incorrect-times 0)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount)) balance)
			(error "NO SO MUCH MONEY")
		)
	)
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance
	)
	(define (dispatch act message)	;是不是应该先输入密码？笑～～		
		(define (get-amount x)
			(cond 
				((not (eq? password message)) (password-incorrect))
				((eq? act 'withdraw) (withdraw x))
				((eq? act 'deposit) (deposit x))
				(else (error "INCORRECT SELECTION"))
			)			
		)
		get-amount
	)

	(define (password-incorrect)
		(set! incorrect-times (+ incorrect-times 1))
		(if (< incorrect-times 7)	
			(display "INCORRECT PASSWORD")		
			(display "COPS IS COMING")						
		)
	)

	dispatch
)



