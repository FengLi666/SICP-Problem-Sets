;负面教材Louis...

;a 
;在写cond的从句时，各从句的判定条件是要考虑其先后顺序的。不能随便换，，
;在此例中，application？是pair？，换到前面就不行了，，

;b 

(define (application? exp)
	(tagged-list? exp 'call)
)



