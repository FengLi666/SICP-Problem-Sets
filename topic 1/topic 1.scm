;--------------1.2------------------

;( define (three_sum x y z )
;	(cond 
;		( (and (< x y ) (< x z ) )	(+ y z) )
;		( (and (< y z ) (< y x ) )	(+ z x) )
;		(else (+ x y ))
;	)
;)

;( define (three_sum x y z )
;	( if ( > x y ) 
;		(if ( > y z )
;					(+ x y)
;					(+ x z))
;		(if ( > x z) 
;					(+ y x)
;					(+ y z))

;	)
;)

;-----------------牛顿法--------------------
;(define (improve-guess guess x)
;	(average guess x) 
;)

;(define (average guess x)
;	(/ (+ guess (/ x guess)) 2)
;)

;(define (good-enough? guess x)
;	(< (abs (- x (* guess guess) ) ) 0.001)
;)

;(define (sqrt-iter guess x)
;  (if (good-enough-for-two? guess x) 
;	guess
;	(
;		sqrt-iter (improve-guess guess x) x 
;	)
;  )
;)

;(define (my-sqrt x)
;	(sqrt-iter 1.0 x)
;)

;-------------------1.8------------------

;(define (improve-guess guess x)
;	(/ (+ (/ x (* guess guess)) (* 2 guess )) 3)
;)

;(define (good-enough? guess x)
;	(< (abs (- x (* guess guess guess) ) ) 0.001)
;)

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x) 
;	guess
;	(
;		sqrt-iter (improve-guess guess x) x 
;	)
;  )
;)

;(define (my-three-sqrt x)
;	(sqrt-iter 1.0 x)
;)

;--------------fib------------------------
;0 1 1 2 3

;树状递归法

;(define (fib n)
;	(cond ((= n 1) 0)
;		((= n 2) 1)
;		(else (+ (fib (- n 1)) (fib (- n 2)) ))
;	)
;)

; iter-method

(define (fib n)
	(define (fib-iter a b count)
		(if (= count n) a 
			(fib-iter b (+ a b) (+ 1 count))
		)
	)
	(fib-iter 0 1 1)
)

;----------------找零钱问题--------------

;(define (charge money)	
;	(cc money 5)

;	(define (cc amount kinds-of-value) 
;		(cond ((= amount 0)	1)
;			( (or (< amount 0) (= kinds-of-value 0) )	0)
;			(else (+ 
;				(cc amount (- kinds-of-value 1))				
;				(cc (- amount (first-value kinds-of-value) )
;						kinds-of-value )
;				 )
;			)
;		)	
;	)
;	(define (first-value kinds)
;		(cond ( (= kinds 1) 1)
;			( (= kinds 2) 5)
;			( (= kinds 3) 10)
;			( (= kinds 4) 25)
;			( (= kinds 5) 50)			
;		)
;	)
;)

;-----------------1.11-------------------

;:::::::::::::::::::::::递归

;(define (f n)
;	(cond 
;		((< n 3)	n)
;		(else	(+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (- n 3))))
;	)
;)

;::::::::::::::::::::::::iter-method

;(define (f n)
;	(define (f-iter a b c cnt)
;		(if (= cnt n)	c
;			(f-iter (+ a (* 2 b) (* 3 c)) a b (+ cnt 1))
;		)
;	)
;	(f-iter 2 1 0 0)
;)

;-----------------1.12-------------------

;(define (paska n m)
;		(if (or (= m 1) (= m n))
;			1
;			(+ (paska (- n 1) (- m 1))
;				(paska (- n 1) m)
;			)
;		)
;)

;--------------1.15----------------------

;(define (cube x ) (* x x x))
;(define (f x ) 
;	(- (* 3 x ) (* 4 (cube x)))
;)
;(define (sine angle)	
;	(if (<= (abs angle) 0.1)	
;		angle
;		(f (sine (/ angle 3.0)))
;	)
;)

;---------------1.16----------------------

(define (fast-expt b n)
	(define (expt-iter y cnt a)
		(if (= cnt 0) a
			(if (even? cnt)
				(expt-iter (* y y ) (/ cnt 2) a)
				(expt-iter y (- cnt 1) (* a y))
			)
		)
	)	
	(expt-iter b n 1)
)

;---------------------1.17
; a*b = a*(b-1)+a
;a*b = 2*a *(b/2)

;(define (double x) (* 2 x))
;(define (halve x) (/ x 2))

;(define (muti x y)
;	(cond 
;		((= y 0) 0)
;		((even? y) (muti (double x) (halve y)))
;		(else (+ x (muti (+ x) (- y 1))))
;	)
;)

;-----------------------1.18

;(define (muti a b)
;	(define (muti-iter x y a)
;		(cond 
;			((= y 0)	a)
;			((even? y) (muti-iter (double x) (halve y) a))
;			(else (muti-iter x (- y 1) (+ a x)))
;		)
;	)
;	(muti-iter a b 0)
;)

;-------辗转相除求法最大公约数--------------

;(define (gcd a b)
;	(if (= b 0)
;	 	a
;	 	(gcd b (remainder a b))
;	)
;)

;(define (coprime? a b)
;	(and (> a b) (= (gcd a b) 1))
;)

;---------找素数之 O(n^1/2)---------------

;(define (prime? n)
;	(define (find-divisor n test-divisor)
;		(cond 
;			( (> (square test-divisor) n) true) 
;			( (= (remainder n test-divisor) 0) false)
;			(else (find-divisor n (next test-divisor)))
;		)
;	)
;	(find-divisor n 2)
;)

;---------找素数之 O(log(n))---------------

;(define (expmod exp a m)
;	(cond 
;		( (= exp 0) 1)
;		( (even? exp)
;			(remainder (square (expmod (/ exp 2) a m)) m))
;		(else	
;			(remainder (* a (expmod (- exp 1) a m)) m))
;	)
;)

;(define (femat-test exp)
;	(define a (+ 1 (random (- exp 1))))
;	(= (expmod exp a exp) a)
;)	

;(define (fast-prime? n times)
;	(cond
;		 ((= times 0) true)
;		 ((femat-test n) (fast-prime? (- times 1) n))
;		 (else false)
;	)
;)

;;----------------1.21-----------------------

;(define (smallest-divisor n)
;	(define (find y)		
;		(cond 
;			 ((> (square y) n) n)
;			 ((= (remainder n y) 0) y)
;			 (else (find (+ y 1)))
;		)
;	)
;	(find 2)
;)

;;----------------1.22 + 1.23 + 1.24-----------------------
;(define (next-odd n)
;	(cond ((even? n) (+ n 1))
;		(else (+ n 2))
;	)
;)

;(define (continue-primes n count)
;    (cond ((= count 0)
;            (display "are primes."))
;          ((fast-prime? 8 n)	; alter
;          ;((prime? n)
;            (display n)
;            (newline)
;            (continue-primes (next-odd n) (- count 1)))
;          (else
;            (continue-primes (next-odd n) count))))

;(define (time-compute n)
;	(define start (real-time-clock))
;	(continue-primes n 3)
;	(- (real-time-clock) start)
;)       

;(define (next n)(if (= n 2) 3 (+ n 2)))
;(define (next n)(+ n 1))

;---------------------1.28-----------------
(define (Miller-Rabin x y)
	(and (not (= x 1)) (not (= x (- y 1))) (= 1 (remainder (square x) y)))
)
(define (expmod exp base m)
	(cond 
		( (= exp 0) 1)
		((Miller-Rabin base m) 0)
		( (even? exp)
			(remainder (square (expmod (/ exp 2) base m)) m))
		(else	
			(remainder (* base (expmod (- exp 1) base m)) m))
	)
)

(define (femat-test exp)
	(define a (+ 1 (random (- exp 1))))
	(= (expmod (- exp 1) a exp) 1)
)	

(define (prime? n)
	(define (fast-prime? n times)
		(cond
			 ((= times 0) true)
			 ((femat-test n) (fast-prime? n (- times 1)))
			 (else false)
		)
	)
	(fast-prime? n 10)
)
;------------------ sum() -------------------------
;(define (sum f a next b)
;	(if (> a b)
;		0
;		(+ (f a) (sum f (next a) next b))
;	)
;)

;----------------integral------------------
;(define (integral f a b dx)
;	(* dx 
;	(sum f (+ a (/ dx 2.0))	 (lambda (x) (+ x dx)) b))
;)
;--------------------1.29-------------------
;(define (concise-integral f a b n)
;	(define h (/ (- b a) n))
;	(define (y k) (f (+ a (* k h))))
;	(define (factor k)
;		(cond
;			((or (= k 0) (= k n)) 1)
;			((even? k) 2)
;			(else 4)
;		)
;	)
;	(define (term k)
;		(* (factor k) (y k))
;	)
;	(* (/ h 3.0) 
;		(sum term 0 (lambda (x) (+ x 1)) n)
;	)	

;)

;------------------1.30-------------------------
;(define (sum f a next b)
;	(define (sum-iter a result)
;		(if (> a b)
;			result
;			(sum-iter (next a) (+ result (f a)))
;		)
;	)
;	(sum-iter a 0)
;)

;----------------1.31-------------------------
;(define (product f a next b)
;	(if (> a b)
;		1
;		(* (f a) (product f (next a) next b))
;	)
;)
;(define (product f a next b)
;	(define (product-iter a result)
;		(if (> a b)
;			result
;			(product-iter (next a) (* result (f a)))
;		)
;	)
;	(product-iter a 1)
;)

;---------------1.32----------------------

;(define (accumulate combiner null-value term a next b)
;	(if (> a b)
;		null-value
;		(combiner (term a)
;			(accumulate combiner null-value term (next a) next b)
;		)
;	)
;)

;(define (accumulate combiner null-value term a next b)
;	(define (iter a result)
;		(if (> a b)
;			result
;			(iter (next a) (combiner (term a) result))
;		)
;	)
;	(iter a null-value)
;)

;---------1.33----------------------

;(define (filtered-accumulate filter combiner null-value term a next b)
;	(define (iter a result)
;		(cond 
;			((> a b) result)
;			((filter a) (iter (next a) (combiner (term a) result)))
;			(else (iter (next a) result))
;		)
;	)
;	(iter a null-value)
;)

;(define (coprime-product n)	
;	(filtered-accumulate (lambda (i) (coprime? n i)) * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n)	
;)

;-------折半法找方程的根---------
;(define (half-interval-method f a b)
;	(define (search f neg-point pos-point)
;		(let ((mid-point (average neg-point pos-point)))
;			(if (close-enough? neg-point pos-point)
;				mid-point
;				(let ((test-value (f mid-point)))
;					(cond 
;						((positive? test-value) (search f neg-point mid-point))
;						((negative? test-value) (search f mid-point pos-point))
;						(else mid-point)
;					)
;				)
;			)
;		)
;	)
;	(define (close-enough? x y)
;		(< (abs (- y x)) 0.01)		
;	)
;	(let (
;			(a-value (f a))
;			(b-value (f b))
;		)
;		(cond 
;			((and (positive? b-value) (negative? a-value))
;				(search f a b)
;			)
;			((and (negative? b-value) (positive? a-value))
;				(search f b a)
;			)
;		)
;	)	
;)

;----------------寻找不动点------------------

;(define tolerance 0.00001)
;(define (fixed-point f first-guess)
;	(define (close-enough? v1 v2)
;		(< (abs (- v1 v2)) tolerance)
;	)
;	(define (try guess)
;		;(display guess)
;		;(newline)
;		(let ((next (f guess)))
;			(if (close-enough? next guess)
;				next
;				(try next)
;			)
;		)
;	)
;	(try first-guess)
;)

;(define (my-sqrt x)
;	(fixed-point (lambda (y) (average y (/ x y))) 1.0)
;)

;----------------1.35----------------

;(define gold-division (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

;证明。。。呃。。。。(●°u°●)​ 」。。。。。

;----------------1.36----------------

;(define xx (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

;(define xx (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2))

;---------------1.37-----------------

;(define (cont-frac n d k)
;	(define (compute i cnt)
;		(if (= cnt 0)
;			(/ (n i) (d i))
;			(/ (n i) (+ (d i) (compute (+ i 1) (- cnt 1))))
;		)
;	)
;	(/ 1 (compute 1 k))
;)

;(define (cont-frac n d k )
;	(define (iter i result)
;		(if (= i 0)
;			result
;			(iter (- i 1)
;				(/ (n i) (+ (d i) result))
;			)
;		)
;	)
;	(iter k 0)
;)

;------------1.38---------------
;2 5 8 11 
;3 6 9 12


;(define (logarithm k)
;	(define (d i)		
;		(if (= (remainder (+ i 1) 3) 0)
;			(* (/ (+ i 1) 3) 2)
;			1
;		)
;	)
;	(+ 2 (cont-frac (lambda (x) 1.0) d k))
;)

;----------1.39----------------

;(define (my-tan x k)
;	(define d 
;		(lambda (i) (- (* 2 i) 1))
;	)
;	(define (n i)		
;		(if (= i 1)
;			x
;			(-(square x))
;		)
;	)
;	(cont-frac n d k)
;)

;--------真。。。牛顿法--------

;(define dx 0.000000001)
;(define (deriv g)
;	(lambda (x)
;		(/ (- (g (+ x dx)) (g x)) dx)
;	)
;)

;(define (newtons-method g guess)
;	(define (f x)
;		(- x (/ (g x) ((deriv g) x)))
;	)	
;	(fixed-point f guess)
;)

;(define (sqrt x)
;	(newtons-method (lambda (y) (- x (square y))) 1.0)
;)

;------------------

;(define (average-damp f)
;	(lambda (x) (average (f x) x))
;)

;(define (fixed-point-transform g transform guess)
;	(fixed-point (transform g) guess)
;)

;(define (sqrt x)
;	(fixed-point-transform 
;		(lambda (y) (/ x y))
;		average-damp
;		1.0
;	)
;)

;------1.40-------
(define cube (lambda (x) (* x x x)))
(define average (lambda (x y) (/ (+ x y) 2.0)))
;(define (cubic a b c)
;	(lambda (x) (+ (cube x) (* a (square x)) (* b x) c))
;)
;-----1.41-------
;(define (double g)
;	(lambda (x) (g (g x)))
;)
;----1.42-------
;(define (compose f g)
;	(lambda (x) (f (g x)))
;)
;;----1.43------
;(define (repeated f n)
;	(define (repeating f cnt result)
;		(if (> cnt 0)
;			(repeating f (- cnt 1) (lambda (x) (f (result x))))
;			result
;		)
;	)
;	(repeating f n (lambda (x) x))
;)
;----1.44------
;(define (smooth f)
;	(lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
;)
;(define (repeated-smooth f n)
;	(repeated (smooth f) n)
;)
;---------1.45------
;(define (expt base n)
;	(if (= n 0)
;		1
;		((repeated (lambda (x) (* base x)) n) 1)
;	)	
;)
;(define (average-damp-n-times f n)
;	((repeated average-damp n) f)
;)
;(define (damped-root n damp-times)
;	(lambda (x) 
;		(fixed-point-transform 
;			(lambda (y) (/ x (expt y (- n 1))))
;			(lambda (t) (average-damp-n-times t damp-times))
;			1.0
;		)
;	)
;)
;(define (lg n)
;	(cond 
;		((< (/ n 2) 1) 0)
;		((> (/ n 2) 1)	(+ 1 (lg (/ n 2))))
;		(else 1)
;	)
;)

;(define (n-root x n)
;	((damped-root n (lg n)) x)
;)
;--------------1.46---------------
;(define (iterative-improve judge improve)
;	(lambda (guess) 
;		(if (judge guess)
;			guess
;			((iterative-improve judge improve) (improve guess))
;		)
;	)
;)
(define (sqrt n)
	(define (good-enough? guess)
		(< (abs (- (square guess) n)) tolerance)
	)
	(define (next-guess guess)
		(average guess (/ n guess))
	)
	((iterative-improve good-enough? next-guess) 1.0)
)
(define tolerance 0.0000001)
(define (fixed-point f first-guess)
	(define (good-enough? guess)
		(< (abs (- guess (f guess))) tolerance)
	)
	(define (next-guess guess)
		(f guess)
	)
	((iterative-improve good-enough? next-guess) first-guess)
)