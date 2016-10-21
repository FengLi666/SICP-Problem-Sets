(load "/Users/fengli/Desktop/SICP Problem Sets/topic 1")

;---2.1---

;(define (make-rat n d)
;	(if (< d 0)
;		(cons (-n) (-d))
;		(cons n d)
;	)
;)

;-----2.2-----

;(define (make-segment a b)
;	(cons a b)
;)
;(define (start-point segment)
;	(car segment)
;)
;(define (end-point segment)
;	(cdr segment)
;)
;(define (make-point x y)
;	(cons x y)
;)
;(define (x-point point)
;	(car point)
;)
;(define (y-point point)
;	(cdr point)
;)
;(define (midpoint-segment segment)
;	(make-point (average (x-point (start-point segment)) (x-point (end-point segment)))
;				(average (y-point (start-point segment)) (y-point (end-point segment)))
;	)
;)
;(define (print-point p)
;    (newline)
;    (display "(")
;    (display (x-point p))
;    (display ",")
;    (display (y-point p))
;    (display ")"))


;----2.3-----

;(define (perimeter-rectangle r)
;	(* 2 (+ (length-of-rectangle r) (width-of-rectangle r)))
;)
;(define (area-rectangle r)
;	(* (length-of-rectangle r) (width-of-rectangle r))
;)
;(define (length-segment segment)
;	(sqrt (+ (square (- (x-point (start-point segment)) (x-point (end-point segment))))
;			(square (- (y-point (start-point segment)) (y-point (end-point segment))))))
;)
;(define (make-rectangle seg w-seg)
;	(cons seg w-seg)	
;)
;(define (seg r)
;	(car r)
;)
;(define (w-seg r)
;	(cdr r)
;)
;(define (length-of-rectangle r)
;	(length-segment (seg r))
;)
;(define (width-of-rectangle r)
;	(length-segment (w-seg r))
;)

;---2.4---

;(define (cons x y)
;	(lambda (m) (m x y))
;)
;(define (car z)
;	(z (lambda (p q) p))
;)
;(define (cdr z)
;	(z (lambda (p q) q))
;)

;---2.5---

;(define (cons a b)
;	(* (expt 2 a) (expt 3 b))
;)
;(define (car z)	
;	(if (= (remainder z 3) 0)
;		(car (/ z 3))
;		z
;	)
;)
;(define (cdr z)	
;	(if (= (remainder z 2) 0)
;		(cdr (/ z 2))
;		z
;	)
;)

;---2.6---

;(define zero (lambda (f) (lambda (x) x)))
;(define (add-1 n)
;	(lambda (f) (lambda (x) (f ((n f) x))))
;)

;(define one 
;	(lambda (f) (lambda (x) (f x)))
;)
;(define two
;	(lambda (f) (lambda (x) (f (f x))))
;)
;(define +
;	(lambda (m)
;		(lambda (n)
;			(lambda (f)
;				(lambda (x)
;					(m f (n f x))
;				)
;			)
;		)
;	)
;)


;---2.7---

;(define (make-interval a b)
;	(cons a b)
;)
;(define (upper-bound i)	(cdr i))
;(define (lower-bound i) (car i))

;;---2.8---

;(define (sub-interval i)
;	(- (upper-bound i) (lower-bound i))
;)

;---2.9---

;(x y) + (a b) = (x+a y+b)
;2d1=y-x		2d2=b-a		2d3=y+b-x-a==2(d1+d2)
;(1 3) * (2 4) =(2 12)
;1 1 5
;(1 10) * (1 1)=(1 10)
;4.5 0 4.5

;---2.10---

;(define (div-interval x y)
;	(muinterval x
;		(if (> (* (lower-bound y) (upper-bound y)) 0)
;			(make-interval 
;				(/ 1.0 (upper-bound y))
;				(/ 1.0 (lower-bound y))
;			)
;			(error "The interval has crossed zero")
;		)
;	)
;)

;---2.11---

;单调烦琐，略

;---2.12---

;(define (make-percent-interval a b)
;	(cons (* a (- 1 b)) (* a (+ 1 b)))
;)
;(define (percent x)
;	(/ (- (cdr x) (car x)) 2)
;)
;(define (center x)
;	(average (car x) (cdr x))
;)

;---2.14---

;(1 2) / (1 2) = (1/2 2)	A/A 	false
;(1 2) / (2 4) = (1/4 1)	A/B 	true
;--2.14~2.16--why?
;(1 2) / (1 2) * (1 2) = (1/2 4)
;so~so

;----------------2.16-------------

;\(・Д・)ノ
;...
;..
;.

;---2.17---

;(define (last-pair l)
;	(if (null? (cdr l))
;		(car l)
;		(last-pair (cdr l))
;	)
;)

;---2.18---

;(define (reverse l)
;	(define (iter remainder result)
;		(if (null? remainder)
;			result
;			(iter (cdr remainder) (cons (car remainder) result))
;		)
;	)
;	(iter l '())
;)

;---2.19---写这道题是解释器出了谜之bug，
;一直说有个谜之函数多了一个参数，艸他妈的
(define (cc amount coin-values)
	(define (no-more? coin-values)
		(null? coin-values)
	)
	(define (except-first-denomination coin-values)
		(cdr coin-values)
	)
	(define (first-denomination coin-values) (car coin-values))	
	(cond 
		((= amount 0)	1)
		((or (< amount 0) (no-more? coin-values))	0)
		(else
			(+ 
				(cc amount (except-first-denomination coin-values))
				(cc (- amount (first-denomination coin-values)) coin-values)					
			)
		)
	)
)

;---2.20---		最后结果如何逆过来呢？//已解决，看来难以避免reverse一次了

(define (same-parity first . l)
	(define (parity-same? x)
		(= 0 (remainder (+ first x) 2))
	)
	(define (iter l-remainder result)
		(if (null? l-remainder)
			(reverse result)
			(if (parity-same? (car l-remainder))
				(iter (cdr l-remainder) (cons (car l-remainder) result))
				(iter (cdr l-remainder) result)
			)
		)
	)
	(iter l '())
)

;---map---

;(define (map proc items)
;	(if (null? items)
;		'()
;		(cons (proc (car items)) (map proc (cdr items)))
;	)
;)

;---append---

;(define (append seq1 seq2)
;	(if (null? seq1)
;		seq2
;		(cons (car seq1) (append (cdr seq1) seq2))
;	)
;)
;---2.21---

(define (square-list items)
	(if (null? items)
		'()
		(cons (square (car items)) (square-list (cdr items)))
	)
)
(define (suqare-list items)
	(map (lambda (x) (* x x)) items)
)

;---2.22---
;参见2.20

;---2.23---
(define (for-each proc items)
	(cond 
		((not (null? items)) (proc (car items)) (for-each proc (cdr items)))
	)
)

;--- count-leaves---
(define (count-leaves x)
	(cond 
		((null? x) 0)
		((not (pair? x)) 1)
		(else
			(+ (count-leaves (car x)) (count-leaves (cdr x)))
		)
	)
)

;---2.27---
(define (deep-reverse x)
	(define (iter l result)
		(cond 
			((null? l) result)
			((list? (car l)) (iter (cdr l) (cons (deep-reverse (car l)) result)))
			(else (iter (cdr l) (cons (car l) result)))					
		)
	)
	(iter x '())
)
;---2.28---
(define (fringe x)
	(define (iter l result)
		(cond 
			((null? l) result)
			((list? (car l)) (iter (cdr l) (append result (fringe (car l)))))
			(else (iter (cdr l) (append result (list (car l)))))
		)
	)
	(iter x '())
)
;---2.29---

(define (make-mobile left right)
	(list left right)
)
(define (make-branch length structure)
	(list length structure)
)
(define left-branch (lambda (x) (car x)))
(define right-branch (lambda (x) (cadr x)))
(define branch-length (lambda (x) (car x)))
(define branch-structure (lambda (x) (cadr x)))

(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile))
		(branch-weight (right-branch mobile))
	)
)
(define (branch-weight branch)
	(cond 
		((hangs-another-branch? branch) (total-weight (branch-structure branch)))
		(else (branch-structure branch))
	)
)

(define (hangs-another-branch? branch)
	(pair? (branch-structure branch))
)

(define (torque-poised? mobile)
	(= (branch-torque (left-branch mobile))
		(branch-torque (right-branch mobile))
	)
)

(define (branch-torque branch)
	(* (branch-length branch) (branch-weight branch))
)
	;	cons-model
;(define (make-mobile left right)
;	(cons left right)
;)
;(define (make-branch length structure)
;	(cons length structure)
;)
;(define right-branch (lambda (x) (cdr x)))
;(define branch-structure (lambda (x) (cdr x)))

;---scale-map---

(define (scale-map tree factor)
	(cond 
		((null? tree) '())
		((not (pair? tree)) (* tree factor))
		(else
			(cons (scale-map (car tree) factor)
					(scale-map (cdr tree) factor)
			)
		)
	)
)

(define (scale-map tree factor)
	(map 
		(lambda (sub-tree)
			(if (pair? sub-tree)
				(scale-map sub-tree factor)
				(* sub-tree factor)
			)
		)
		tree
	)
)

;---2.30---

(define (square-tree tree)
	(map 
		(lambda (sub-tree)
			(if (pair? sub-tree)
				(square-tree sub-tree)
				(* sub-tree sub-tree)
			)
		)
		tree
	)
)
(define (square-tree tree)
	(cond 
		((null? tree) '())
		((not (pair? tree)) (* tree tree))
		(else
			(cons (square-tree (car tree))
					(square-tree (cdr tree))
			)
		)
	)
)

;---2.31---

(define (tree-map proc tree)
	(cond 
		((null? tree) '())
		((not (pair? tree)) (proc tree))
		(else 
			(cons (tree-map proc (car tree))
					(tree-map proc (cdr tree))
			)
		)
	)
)

(define (square-tree tree)
	(tree-map square tree)
)

;---2.32---		唉，值得反思。看了，做了，真正理解透彻了吗，能举一反三吗？

(define (subsets s)
	(if (null? s)
		(list '())
		(let ((rest (subsets (cdr s))))
				(display rest) (display "   ")		(display (car s))
				(newline)
				(append rest (map (lambda (x) (cons (car s) x)) rest))
		)	
	)
)

;---序列作为约定界面---

(define (filter predicate sequence)
	(cond 
		((null? sequence) '())
		((predicate (car sequence))
			(cons (car sequence) (filter predicate (cdr sequence))))
		(else (filter predicate (cdr sequence)))		
	)
)

(define (accumulate op sequence init)
	(if (null? sequence)
		init
		(op (car sequence) (accumulate op (cdr sequence) init))
	)
)

(define enumerate-tree fringe)

(define (enumerate-interval low high interval)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low interval) high interval))
	)	
)

(define (sum-odd-square tree)
	(accumulate
		+
		(map square (filter odd? (enumerate-tree tree)))
		0		
	)
)

(define (even-fib n)
	(accumulate 
		cons
		(filter even? (map fib (enumerate-interval 1 n 1)))
		'()
	)
)

;---2.33---

;(define (map p sequence)
;	(accumulate (lambda (x y) (cons (p x) y)) sequence '())
;)

;(define (append seq1 seq2)
;	(accumulate cons seq1 seq2)
;)

;(define (length sequence)
;	(accumulate (lambda (x y) (+ y 1)) sequence 0)
;)

;---2.34---

(define (horner-eval x coefficient-sequence)
	(accumulate 
		(lambda (this-coeff higher-terms)
			(+ this-coeff (* x higher-terms))
		)
		coefficient-sequence
		0
	)
)

;---2.35---

(define (count-leaves t)
	(accumulate 
		(lambda (x y) (+ y 1))
		(enumerate-tree t)
		0
	)
)

;---2.36---
;咳咳。。要看清题啊
;(define (accumulate-n op sequence init)		
;	(if (null? sequence)
;		'()
;		(cons
;			(accumulate op (car sequence) init)
;			(accumulate-n op (cdr sequence) init)
;		)
;	)
;)

(define (accumulate-n op seqs init)
	(if (null? (car seqs))
		'()
		(cons (accumulate op (car-n seqs) init)
			(accumulate-n op (cdr-n seqs) init)
		)
	)
)
(define (cdr-n seqs)
    (map cdr seqs))
(define (car-n seqs)
    (map car seqs))

;---2.37---

(define (dot-product v w)
	(accumulate + (map * v w) 0)
)

(define (matrix-*-vactor m v)
	(map (lambda (col) (dot-product col v)) m)
)

(define (transpose m)
	(accumulate-n cons m '())
)

(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		(map (lambda (x) (matrix-*-vactor cols x)) m)
	)
)

;---2.38---

(define fold-right accumulate)
(define (fold-left op seq init)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest))
					(cdr rest)
			)
		)
	)
	(iter init seq)
)

;---2.39---

(define (r-reverse seq)
	(fold-right (lambda (x y) (append y (list x))) seq '())
)

(define (l-reverse seq)
	(fold-left (lambda (x y) (cons y x)) seq '())
)

;---

(define (flatmap proc seq)
	(accumulate append (map proc seq) '())
)

;(define (prime-sum? pair)
;	(prime? (+ (car pair) (cadr pair)))
;)

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

;(define (prime-sum-pairs n)
;	(map 
;		make-pair-sum 
;		(filter prime-sum?		
;			(unique-pairs n)
;		)
;	)
;)

;---2.40---

(define (unique-pairs n)
	(flatmap
		(lambda (i) 
				(map (lambda (j) (list i j))
					(enumerate-interval 1 (- i 1) 1)
				)
		)
		(enumerate-interval 1 n 1)
	)	
)

;---2.41---

(define (^_^ n)
	(define (unique-pairs-triple n)
		(flatmap
			(lambda (i)
				(map 
					(lambda (j)
						(cons i j)
					)
					(unique-pairs (- i 1))
				)
			)
			(enumerate-interval 1 n 1)
		)
	)

	(define (make-pair-sum pairs)
		(append pairs (list (sum pairs)))
	)

	(define (s-sum? pairs)
		(= (sum pairs) n)
	)

	(filter s-sum?
		(unique-pairs-triple n)
	)
)
;琢磨好久
(define (unique-triples n)
    (flatmap (lambda (i)
               (flatmap (lambda (j)
                          (map (lambda (k) (list i j k))
                               (enumerate-interval 1 (- j 1) 1)))
                        (enumerate-interval 1 (- i 1) 1)))
             (enumerate-interval 1 n 1)))

;---2.42---

(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter
				(lambda (positions) (safe? k positions))
				(flatmap
					(lambda (rest-of-queens)
						(map 
							(lambda (new-row)
								(adjoin-position new-row k rest-of-queens)
							)
							(enumerate-interval 1 board-size 1)							
						)
					)
					(queen-cols (- k 1))
				)
			)
		)
	)

	(define empty-board '())

	(define (safe? k positions)
		(define (iter l n)
			(cond 
				((null? l) true)
				((or (= (car l) (+ (car positions) n)) (= (car l) (- (car positions) n)) (= (car l) (car positions))) false)
				(else (iter (cdr l) (+ n 1)))
			)
		)
		(iter (cdr positions) 1)
	)

	(define (adjoin-position row k rest-of-queens)
		(cons row rest-of-queens)
	)

	(queen-cols board-size)
)

;---2.44---

;(define (up-split painter n)
;	(if (= n 0)
;		painter
;		(let 
;			((smaller (up-split painter (- n 1))))
;			(below painter (beside smaller smaller))
;		)
;	)
;)

;;---2.45---

;(define up-split (split below beside))
;(define right-split (split beside below))

;(define (split big-cominer small-combiner)
;	(lambda (painter n)
;		(if (= n 0)
;			painter
;			(let 
;				((smaller ((split big-cominer small-combiner) painter (- n 1))))
;				(big-cominer painter (small-combiner smaller smaller))
;			)
;		)
;	)
;)

;(define (split big-cominer small-combiner)	;用一个内部函数缩短了代码
;	(define (inner painter n)
;		(if (= n 0)
;			painter
;			(let 
;				((smaller (inner painter (- n 1))))
;				(big-cominer painter (small-combiner smaller smaller))
;			)
;		)
;	)
;	inner
;)

;---2.46---

;(define (frame-coord-map frame)
;	(lambda (v)
;		(add-vect
;			(origin-frame frame)
;			(add-vect 
;				(scale-vect (xcor-vect v) (edge1-frame frame))
;				(scale-vect (ycor-vect v) (edge2-frame frame))
;			)
;		)
;	)
;)

;(define (make-vect x y)	(list x y))
;(define (xcor-vect v) (car v))
;(define (ycor-vect v) (cadr v))
;(define (add-vect v1 v2)
;	(make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2)))
;)
;(define (sub-vect v1 v2)
;	(make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2)))
;)
;(define (scale-vect dimension edge)
;	(make-vect (* dimension (xcor-vect edge)) (* dimension (ycor-vect edge)) )
;)

;---2.47---

;(define (make-frame origin edge1 edge2)
;	(list origin edge1 edge2)
;)
;(define (edge1-frame frame) (cadr frame))
;(define (edge2-frame frame) (caddr frame))
;(define (origin-frame frame) (car frame))

;;---2.48---

;(define (segment->painter segment-list)
;	(lambda (frame)
;		(for-each
;			(lambda (segment)
;				(draw-line
;					((frame-coord-map frame) (start-segment segment))
;					((frame-coord-map frame) (end-segment segment))
;				)
;			)
;			segment-list
;		)
;	)
;)

;(define (make-segment start end) (list start end))
;(define (start-segment segment) (car segment))
;(define (end-segment segment) (cadr segment))

;---2.49---

;(define a 
;	(segment->painter 
;		(list 
;			(make-segment (make-vect 0 0) (make-vect 1 0)) 
;			(make-segment (make-vect 1 0) (make-vect 1 1))
;			(make-segment (make-vect 1 1) (make-vect 0 1))
;			(make-segment (make-vect 0 1) (make-vect 0 0))
;		)
;	)
;)
;(define b 
;	(segment->painter
;		(list 
;			(make-segment (make-vect 0 0) (make-vect 1 1))
;			(make-segment (make-vect 0 1) (make-vect 1 0))
;		)
;	)
;)
;(define c 
;	(segment->painter
;		(list 
;			(make-segment (make-vect 0.5 0) (make-vect 1 0.5)) 
;			(make-segment (make-vect 1 0.5) (make-vect 0.5 1))
;			(make-segment (make-vect 0.5 1) (make-vect 0 0.5))
;			(make-segment (make-vect 0 0.5) (make-vect 0.5 0))
;		)
;	)
;)
;(define d 
;	;这题也是日了🐶了
;)

;--- ---

;(define (transform-painter painter origin corner1 corner2)
;	(lambda (frame)
;		(let ((m (frame-coord-map frame)))
;			(let ((new-origin (m origin)))
;				(painter
;					(make-frame
;						(new-origin)
;						(sub-vect (m corner1) new-origin)
;						(sub-vect (m corner2) new-origin)
;					)
;				)
;			)
;		)
;	)
;)
;(define (flip-vert painter)
;	(transform-painter painter
;		(make-vect 0 1)
;		(make-vect 1 1)
;		(make-vect 0 0)
;	)
;)

;(define (shrink-to-upper-right painter)
;	(transform-painter painter
;		(make-vect 0.5 0.5)
;		(make-vect 0.5 1.0)
;		(make-vect 1.0 0.5)
;	)
;)

;(define (rotate90 painter)
;	(transform-painter painter 
;		(make-vect 1.0 0.0)
;		(make-vect 0.0 0.0)
;		(make-vect 1.0 1.0)
;	)
;)

;;...

;(define (beside painter1 painter2)
;	(let ((split-point (make-vect 0.5 0.0)))
;		(let ((painter-left (transform-painter painter1 (make-vect 0.0 0.0) split-point (make-vect 0.0 1.0))
;			(painter-right (transform-painter painter2 split-point (make-vect 1.0 0.0) (make-vect 0.5 1.0)))
;			 )		
;			(lambda (frame) 
;				(painter-left frame)
;				(painter-right frame)				
;			)
;		)
;	)
;)

;---2.50---

;(define (flip-horiz painter)
;	(transform-painter painter 
;		(make-vect 1.0 0.0)
;		(make-vect 0.0 0.0)
;		(make-vect 1.0 1.0)
;	)
;)

;(define (rotate180 painter)
;	(transform-painter painter
;		(make-vect 1.0 1.0)
;		(make-vect 0.0 1.0)
;		(make-vect 1.0 0.0)
;	)
;)

;(define (rotate270 painter)
;	(transform-painter painter
;		(make-vect 1.0 0.0)
;		(make-vect 0.0 0.0)
;		(make-vect 1.0 1.0)
;	)
;)

;---2.51---

;(define (below painter1 painter2)
;	(let ((split-point (make-vect 0.0 0.5)))
;		(let ((painter-lower (transform-painter painter (make-vect 0.0 0.0) (make-vect 1.0 0.0) split-point))
;				(painter-upper (transform-painter painter split-point (make-vect 1.0 0.0) (make-vect 0.0 1.0))
;			)
;			(lambda (frame)
;				(painter-lower frame)
;				(painter-upper frame)
;			)
;		)
;	)
;)

;(define (below painter1 painter2)
;	(lambda (frame)
;		(let ((painter-lower (rotate270 painter1)) (painter-upper (rotate270 painter2)))
;			(rotate90 (beside painter-lower painter-upper)
;		)
;	)
;)

;---2.52--- 这一题莫名其妙

;(define smiling-face->painter
	;😄
;)

;(define (corner-split n)
	;tm什么鬼啊，想不出啊，网上答案全错了啊
;)

;c...

;--- ---

(define (memq item x)
	(cond 
		((null? x) false)
		((eq? (car x) item) x)
		(else (memq item (cdr x)))
	)
)

;---2.54---

(define (equal? list1 list2)
	(cond 		
		((and (null? list1) (null? list2)) true)
		((or (null? list1) (null? list2)) false)
		((eq? (car list1) (car list2)) (equal? (cdr list1) (cdr list2)))		
		(else false)
	)
)

;---2.55---

;	'a == (quote a)
;	(car '(quote a)) == quote

;---实例：符号求导---

(define (deriv exp var) 
	(cond
		((number? exp) 0)
		((variable? exp)
			(if (same-variable? exp var) 1 0)
		)
		((sum? exp) 
			(make-sum (deriv (addend exp) var) (deriv (augend exp) var))
		)
		((product? exp ) 
			(make-sum
				(make-product (multiplier exp) (deriv (multiplicand exp) var))
				(make-product (multiplicand exp) (deriv (multiplier exp ) var))
			)
		)
		(else
			(error "unknow expression type -- DERIV" exp)
		)
	)
)

(define variable? symbol?)

(define same-variable? eq?)

(define (make-sum a1 a2)
	(cond
		((=number? a1 0) a2)
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list '+ a1 a2))
	)
)

(define (make-product m1 m2)
	(cond 
		((or (=number? m1 0) (=number? m2 0)) 0)
		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
		(else (list '* m1 m2))
	)
)

(define (=number? a b)
	(and (number? a) (= a b))
)

(define (sum? s)
	(and (pair? s) (eq? (car s) '+))
)

(define (product? s)
	(and (pair? s) (eq? (car s) '*))	
)

(define addend cadr)
;(define augend caddr)
(define multiplier cadr)
;(define multiplicand caddr)

;---2.56---

(define (deriv exp var) 
	(cond
		((number? exp) 0)
		((variable? exp)
			(if (same-variable? exp var) 1 0)
		)
		((exponentiation? exp) 
			(if (number? (exponent exp))
				(make-product (exponent exp) (make-product (make-exponentiation (base exp) (- (exponent exp) 1)) (deriv (base exp) var)))
				(let ((n (exponent exp)))
					(make-product (exponent exp) (make-product (make-exponentiation (base exp) '(- n 1)) (deriv (base exp) var)))
				)
			)
		)
		((sum? exp) 
			(make-sum (deriv (addend exp) var) (deriv (augend exp) var))
		)
		((product? exp ) 
			(make-sum
				(make-product (multiplier exp) (deriv (multiplicand exp) var))
				(make-product (multiplicand exp) (deriv (multiplier exp) var))
			)
		)
		(else
			(error "unknow expression type -- DERIV" exp)
		)
	)
)

(define (make-exponentiation base exp)
	(cond 
		((=number? exp 0) 1)
		((=number? exp 1) base)
		(else (list '** base exp))
	)
)
(define (exponentiation? exp)
	(and (pair? exp) (eq? (car exp) '**))
)
(define exponent caddr)
(define base cadr)

;---2.57---		

(define (augend s)
	(define (iter l r)
		(if (null? l)
			r
			(iter (cdr l) (make-sum r (car l)))
		)
	)    	
		(iter (cddr s) 0)
)

(define (multiplicand s)
	(define (iter l r)
		(if (null? l)
			r
			(iter (cdr l) (make-product r (car l)))
		)
	)
		(iter (cddr s) 1)
)
		;---!!!!!!!!!!!!!!!!!!!!!!!!!-----wocao!!!
		;我像傻逼一样用了一晚上写了个超复杂的方法被一个tm叫Genovia的货
		;用三行代码完虐！！！！！！！！！！！！！！！！
(define (augend s) 
   (if (> (length s) 3) 
       (cons '+ (cddr s)) 
       (caddr s))) 
  
 (define (multiplicand p) 
   (if (> (length p) 3) 
       (cons '* (cddr p)) 
       (caddr p))) 


;---2.58---

(define (sum? s);---------------------------a
	(and (pair? s) (eq? (cadr s) '+) ())
)
(define augend caddr)
(define addend car)
(define (product? s)
	(and (pair? s) (eq? (cadr s) '*))
)
(define multiplicand caddr)
(define multiplier car)
(define (make-sum a1 a2)
	(cond
		((=number? a1 0) a2)
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list a1 '+ a2))
	)
)

(define (make-product m1 m2)
	(cond 
		((or (=number? m1 0) (=number? m2 0)) 0)
		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
		(else (list m1 '* m2))
	)
)

;---b－无解？

;------------

(define (equal? a b)
	(cond 
		((and (symbol? a) (symbol? b)) (eq? a b))
		((and (number? a) (number? b)) (= a b))
		((and (null? a) (null? b)) true)
		((and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))		
		(else false)
	)
)

(define (element-of-set? x s)
	(cond 
		((null? s) false)
		((equal? x (car s)) true)		
		(else (element-of-set? x (cdr s)))
	)
)

(define (adjoin-set x s)
	(if (element-of-set? x s)
		s 
		(cons x s)
	)
)

(define (intersection-set s1 s2)
	(cond 
		((or (null? s1) (null? s2)) '())
		((element-of-set? (car s1) s2) 
			(cons (car s1) 
				(intersection-set (cdr s1) s2)
			)
		)
		(else (intersection-set (cdr s1) s2))
	)
)

;---2.59---

(define (union-set s1 s2)
	(cond 
		((null? s1) s2)
		((null? s2) s1)
		(else (union-set (cdr s1) (adjoin-set (car s1) s2)))
	)
)

;---2.60---

(define element-of-set-l? element-of-set?);---O(n)
(define adjoin-set-l cons);---O(1)
(define intersection-set-l intersection-set);---O(n**2)
(define union-set-l append);---O(n)

	;---
(define (remove-of-set x s)
	(cond 
		((null? s) '())
		((equal? x (car s)) (remove-of-set x (cdr s)))
		(else (cons (car s) (remove-of-set x (cdr s))))
	)
)

;------2.61 2.62------

(define (element-of-set? x s)
	(cond 
		((> (car s) x)	false)
		((= (car s) x) true)
		(else (element-of-set? x (cdr s)))
	)
)

(define (adjoin-set x s)
	(cond 
		((< x (car s))	(cons x s))
		((= x (car s)) s)
		(else (cons (car s) (adjoin-set x (cdr s))))
	)
)

(define (intersection-set-sorted-list s1 s2)
	(if (or (null? s1) (null? s2))
		'()
		(let 
			((x1 (car s1)) (x2 (car s2)))
			(cond 
				((= x1 x2)	(cons x1 (intersection-set-sorted-list (cdr s1) (cdr s2))))
				((< x1 x2)	(intersection-set-sorted-list (cdr s1) s2))
				((> x1 x2)	(intersection-set-sorted-list s1 (cdr s2)))
			)
		)
	)
)

(define (union-set-sorted-list s1 s2)
	(cond 
		((null? s1) s2)
		((null? s2) s1)
		(else 
			(let 
				((x1 (car s1)) (x2 (car s2)))
				(cond 
					((= x1 x2) (cons x1 (union-set-sorted-list (cdr s1) (cdr s2))))
					((> x1 x2) (cons x2 (union-set-sorted-list s1 (cdr s2))))
					(else (cons x1 (union-set-sorted-list (cdr s1) s2)))
				)
			)
		)
	)
)

;--- ---

(define entry car)
(define left-branch cadr)
(define right-branch caddr)
(define (make-tree entry left right) 
	(list entry left right)
)

(define (element-of-set? x s)
	(cond 
		((null? s) false)
		((= x (entry s)) true)
		((< x (entry s))
			(element-of-set? x (left-branch s))
		)
		((> x (entry s))
			(element-of-set? x (right-branch s))
		)
	)
)

(define (adjoin-set x s)
	(cond 
		((null? s) (make-tree x '() '()))
		((= x (entry s)) s)
		((< x (entry s)) 
			(make-tree
				(entry s)
				(adjoin-set x (left-branch s))
				(right-branch s)
			)
		)
		((> x (entry s))
			(make-tree
				(entry s)
				(left-branch s)
				(adjoin-set x (right-branch s))
			)
		)
	)
)

;---2.63---		;网上答案全不一样什么鬼(((o(*ﾟ▽ﾟ*)o)))，我要好好学算法分析！

(define (tree->list-1 tree)
	(cond 
		((null? tree)	'())
		(else 
			(append
				(tree->list-1 (left-branch tree))
				(cons (entry tree) (tree->list-1 (right-branch tree)))
			)
		)
	)
)
;T(n) = 2*T(n/2) + O(n/2)
;=2*(2*T(n/4) + O(n/4))+O(n/2)
;=0+O(n/2)+O(n/4)*2+O(n/8)*4+...
;=(logn)*O(n/2)
;so , O(nlogn)

(define (tree->list-2 tree)
	(define (copy-to-list tree result)
		(if (null? tree)
			result
			(copy-to-list (left-branch tree)
				(cons (entry tree) (copy-to-list (right-branch tree) result))
			)
		)
	)
	(copy-to-list tree '())
)

;T(n)=2*T(n/2)+O(1)=O(1)+2*O(1)+...+2^(log n)O(1)=O(2^(log 2n))
;so , O(n)


;---2.64---

(define (list->tree elements)	
	(define (partial-tree elts n)
		(if (= n 0)
			(cons '() elts)
			(let 
				((left-size (quotient (- n 1) 2)))
				(let 
					((left-result (partial-tree elts left-size)))
					(let 
						((left-tree (car left-result))
							(none-left-elts (cdr left-result))
							(right-size (- n (+ 1 left-size)))
						)
						(let 
							((this-entry (car none-left-elts))
								(right-result (partial-tree (cdr none-left-elts) right-size))
							)
							(let 
								((right-tree (car right-result))
									(remaining-elts (cdr right-result))
								)
								(cons 
									(make-tree this-entry left-tree right-tree)
									remaining-elts
								)
							)
						)
					)
				)
			)
		)
	)
	(car (partial-tree elements (length elements)))
)
;T(n)=2*T(n/2)+O(1)
; so , O(n)

;---2.65---

(define tree->list tree->list-2)

(define (union-set-tree tree1 tree2)
	(let 
		(
			(list1 (tree->list tree1))
			(list2 (tree->list tree2))
		)
		(let 
			((union-set-list (union-set-sorted-list list1 list2)))
			(list->tree union-set-list)
		)
	)
)

(define (intersection-set-tree tree1 tree2)
	(let 
		(
			(list1 (tree->list tree1))
			(list2 (tree->list tree2))
		)
		(let 
			((intersection-set-list (intersection-set-sorted-list list1 list2)))
			(list->tree intersection-set-list)
		)
	)
)

;---2.66---

(define (lookup given-key set-of-records)
	(cond 
		((null? set-of-records) false)
		((equal? given-key (key (entry set-of-records))) true)
		((< given-key (key (entry set-of-records)))
			(element-of-set? given-key (left-branch set-of-records))
		)
		((> given-key (key (entry set-of-records)))
			(element-of-set? given-key (right-branch set-of-records))
		)
	)
)

;--------huffman tree

(define (make-leaf symbol weight)
	(list 'leaf symbol weight)
)
(define (leaf? object)
	(eq? (car object) 'leaf)
)
(define symbol-leaf cadr)
(define weight-leaf caddr)
(define (make-code-tree left right)
	(list 
		left
		right 
		(append (symbols left) (symbols right))
		(+ (weight left) (weight right))
	)
)

(define left-branch (lambda (x) (car x)))
(define right-branch (lambda (x) (cadr x)))

(define (symbols tree)
	(if (leaf? tree)
		(list (symbol-leaf tree))
		(caddr tree)
	)
)
(define (weight tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(cadddr tree)
	)
)

(define (decode bits tree)
    (define (decode-1 bits current-branch)
        (if (null? bits)
            '()
            (let 
            	((next-branch (choose-branch (car bits) current-branch)))
                (if (leaf? next-branch)
                    (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
                    (decode-1 (cdr bits) next-branch)))))
    (decode-1 bits tree))

(define (choose-branch bit branch)
	(cond 
		((= bit 0) (left-branch branch))
		((= bit 1) (right-branch branch))
		(else (error "bad bit: not 0/1"))
	)
)

(define (adjoin-set x set)
	(cond 
		((null? set) (list x))
		((< (weight x) (weight (car set))) (cons x set))
		(else (cons (car set) (adjoin-set x (cdr set))))
	)
)

(define (make-leaf-set pairs)
	(if (null? pairs)
		'()
		(let ((pair (car pairs)))
			(adjoin-set 
				(make-leaf (car pair)
					(cadr pair)
				)
				(make-leaf-set (cdr pairs))
			)
		)
	)
)

;---2.67---

(define sample-tree 
	(make-code-tree (make-leaf 'A 4) 
		(make-code-tree 
			(make-leaf 'B 2)
			(make-code-tree
				(make-leaf 'C 1)
				(make-leaf 'D 1)
			)
		)
	)
)
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;(decode sample-message sample-tree)
;(a c a b b d a)

;---2.68---

(define (encode message tree)
	(if (null? message)
		'()
		(append (encode-symbol (car message) tree) (encode (cdr message) tree))
		;1
	)
)

(define (encode-symbol word tree)	
	(cond 
		((leaf? tree) '())
		((word-in-tree? word (left-branch tree))
			(cons 0 (encode-symbol word (left-branch tree)))
		)
		((word-in-tree? word (right-branch tree))
			(cons 1 (encode-symbol word (right-branch tree)))
		)
		(else (error "the word is not in the tree"))
	)
)

(define (element-of-set? x s)
	(cond 
		((null? s) false)
		((equal? x (car s)) true)		
		(else (element-of-set? x (cdr s)))
	)
)

(define (word-in-tree? word tree)
	(element-of-set? word (symbols tree))
)

;---2.69---

(define (generate-huffman-tree pairs)
	(successive-merge (make-leaf-set pairs))
)

(define (successive-merge sorted-leaf-set)
	
	(cond 
		((<= (length sorted-leaf-set) 1) (car sorted-leaf-set))
		(else 
			(successive-merge 
				(adjoin-set
					(make-code-tree (car sorted-leaf-set) (cadr sorted-leaf-set))
					(cddr sorted-leaf-set)
				)
			)
		)
	)
)

;---2.70---

(define rock-tree
	(generate-huffman-tree '((A 2) (NA 16) (BOOM 1) (SHA 3) 
		(GET 2) (YIP 9) (JOB 2) (WAH 1)))
)

(define rock-song 
	'(Get a job Sha na na na na na na
	 na na Get a job Sha na na na na na na na na Wah 
	yip yip yip yip yip yip yip yip yip Sha boom)
)
(define rock-bits (encode rock-song rock-tree))

;song 36
;huffman 84
;fixed length 108

;---2.71---

; min 1
;max n-1

;---2.72---

; max O(n**2)
; min O(n)



;---2.73---

(define (deriv exp var)
	((number? exp) 0)
	((variable? exp)
		(if (same-variable? exp var) 1 0)
	)
	(else 
		((get 'deriv (operator exp)) (operands exp) var)
	)
)

(define operator car)
(define operands cdr)

(define (install-sum-and-mul-and-exp-package)
	(define addend car)		;sum
	(define augend cadr)
	(define (deriv-sum s x)
		(make-sum (deriv (addend s) x) (deriv (augend s) x))
	)
	(define (make-sum s1 s2)
		(cond 
			((=number? s1 0) s2)
			((=number? s2 0) s1)
			((and (number? s1) (number? s2)) (+ s1 s2))
			(else (list '+ s1 s2))
		)
	)	


	(define multiplier car)		;product
	(define multiplicand cadr)
	(define (deriv-mul s x)
		(make-sum
			(make-product (deriv (multiplier s) x) (multiplicand s))
			(make-product (multiplier s) (deriv (multiplicand s) x))
		)
	)
	(define (make-product s1 s2)
		(cond 
			((or (=number? s1 0) (=number? s2 0)) 0)
			((=number? s1 1) s2)
			((=number? s2 1) s1)
			(else (list '* s1 s2))
		)
	)


	(define base car)			;exp
	(define exponent cadr)
	(define (deriv-exp x n)
		(if (number? (exponent exp))
			(make-product (exponent exp) (make-product (make-exponentiation (base exp) (- (exponent exp) 1)) (deriv (base exp) var)))
			(let ((n (exponent exp)))
				(make-product (exponent exp) (make-product (make-exponentiation (base exp) '(- n 1)) (deriv (base exp) var)))
			)
		)
	)

	(put 'deriv '** deriv-exp)	;start all putting
	(put 'deriv '+ deriv-sum)
	(put 'deriv '* deriv-mul)
)

;d: switch the position of operator and sort in put

;---2.74---

;	\(・Д・)ノ		神
;	  {  }			T
;	   ||			M
;	   /\			题

;---2.75---

(define (make-from-mag-ang mag ang)
	(define (dispatch op)
		(cond 
			((eq? op 'real-part) (* mag (cos ang)))
			((eq? op 'imag-part) (* mag (sin ang)))
			((eq? op 'magnitude) mag)
			((eq? op 'angle) ang)
			(else (error "Unknown op"))
		)		
	)
	dispatch
)

;---2.76---

;数据导向性和消息传递型都适合添加type
;而操作总要手动添加的吧？（；゜０゜）
;虽然不太对劲。。。

;--- 2-5 ---

(define (apply-generic op . args)
	(let ((type-tags (map type-tags args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map contents args))
				(error "No method for these types --apply-generic"
					(list op type-tags)
				)
			)
		)
	)
)

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (install-scheme-number)
	(define (tag x)	(attach-tag 'scheme-number x))
	(put 'add '(scheme-number scheme-number) 
		(lambda (x y) (tag (+ x y)))
	)
	(put 'sub '(scheme-number scheme-number) 
		(lambda (x y) (tag (- x y)))
	)
	(put 'mul '(scheme-number scheme-number) 
		(lambda (x y) (tag (* x y)))
	)
	(put 'div '(scheme-number scheme-number) 
		(lambda (x y) (tag (/ x y)))
	)
	(put 'make 'scheme-number '(scheme-number scheme-number) 
		(lambda (x) (tag x))
	)
	(put 'equ? '(scheme-number scheme-number) 
		(lambda (x y) (tag (= x y)))
	)
	done'
)

(define (make-scheme-number n)
	((get 'make 'scheme-number) n)
)

(define (install-rational-package)
	(define numer car)
	(define denom cdr)
	(define (make-rat n d)
		(let ((g (gcd n d)))
			(cons (/ n g) (/ d g))
		)
	)
	(define (add-rat x y)
		(make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
			(* (denom x) (denom y))
		)
	)
	(define (sub-rat x y)
		(make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
			(* (denom x) (denom y))
		)
	)
	(define (mul-rat x y)
		(make-rat (* (numer x) (numer y)) (* (denom x) (denom y)))
	)
	(define (div-rat x y)
		(make-rat (* (numer x) (denom y)) (* (denom x) (numer y)))
	)

	(define (tag x) (attach-tag 'rational x))
	(put 'add '(rational rational) 
		(lambda (x y) (tag (add-rat x y)))
	)
	(put 'sub '(rational rational) 
		(lambda (x y) (tag (sub-rat x y)))
	)
	(put 'mul '(rational rational) 
		(lambda (x y) (tag (mul-rat x y)))
	)
	(put 'div '(rational rational) 
		(lambda (x y) (tag (div-rat x y)))
	)
	(put 'make 'rational (lambda (x y) (tag (make-rat x y))))	
	'done
)

(define (make-rational x y)
	((get 'make 'rational) x y)
)

;---2.77---
; shadiao Louis has not put magnitude with complex type in 

;---2.78---

(define (type-tags x)
	(cond 
		((number? x) 'scheme-number)
        ((pair? x) (car x))
        (else (error "Bad tagged x -- TYPE-TAG" x)))
)
(define (contents x)
	(cond 
		((number? x) x)
        ((pair? x) (cdr x))
        (else (error "Bad tagged x -- TYPE-TAG" x)))	
)
(define (attach-tags tags x)
	(if (number? x)
		x 
		(cons tags x)
	)
)

;---2.79---

(define (equ? x y) (apply-generic 'equ? x y))
;...没啥意思

;---2.80---

;还是没啥意思

;---2.81---

;伟大的Louis...他写的过程会无限递归下去*･゜ﾟ･*:.｡..｡.:*･'(*ﾟ▽ﾟ*)'･*:.｡. .｡.:*･゜ﾟ･*

(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc 
				(apply proc (map contents args))
				(let ((raise-error (error "No method for these types"
                            (list op type-tags))))
					(if (= (length args) 2)
						(let 
							((type1 (car type-tags))
	                          (type2 (cadr type-tags))
	                          (a1 (car args))
	                          (a2 (cadr args)))
	                        (if (equal? type1 type2)      ;new
	                            raise-error
	                            (let ((t1->t2 (get-coercion type1 type2))
	                                  (t2->t1 (get-coercion type2 type1)))
	                                (cond (t1->t2
	                                        (apply-generic op (t1->t2 a1) a2))
	                                      (t2->t1
	                                        (apply-generic op a1 (t2->t1 a2)))
	                                    (else
	                                        raise-error
	                                    )
	                                )
	                            )
	                        )
	                    )
	                   	raise-error
	                )
				)
			)
		)
	)
)

;---2.82---

(define (apply-generic op . args) 
   ; coercing list to a type 
   (define (coerce-list-to-type lst type) 
		(map 
			(lambda (x) 
				(let ((proc (get-coercion (type-tag x) type)))
					(if proc 
						(proc x)
						x
					)
				)
			)
			lst
		)			
   )
   ; applying to a list of multiple arguments 
   (define (apply-coerced lst) 
     (if (null? lst) 
       (error "No method for given arguments") 
       (let ((coerced-list (coerce-list-to-type args (type-tag (car lst))))) 
         (let ((proc (get op (map type-tag coerced-list)))) 
           (if proc 
             (apply proc (map contents coerced-list)) 
             (apply-coerced (cdr lst)))))))
  
   ; logic to prevent always coercing if there is already direct input entry 
   (let ((type-tags (map type-tag args))) 
     (let ((proc (get op type-tags))) 
       (if proc 
         (apply proc (map contents args)) 
         (apply-coerced args))))) 

;---2.83---

(define (raise x) (apply-generic 'raise 'x))
(put 'raise 'integer (lambda (x) (make-rational x 1)))
(put 'raise 'rational (lambda (x) (make-real (/ (numer x) (demon x)))))
(put 'raise 'real (lambda (x) (make-from-real-img x 0)))

;---2.84---


(define (apply-generic op . args)
	(define (raise-til a b)
		(cond 
			((eq? a b) true)
			((raise a) (raise-til (raise a) b))
			(else false)
		)
	)

	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc 
				(apply proc (map contents args))
				(let ((raise-error (error "No method for these types"
                            (list op type-tags))))
					(if (= (length args) 2)
						(let 
							((type1 (car type-tags))
	                          (type2 (cadr type-tags))
	                          (a1 (car args))
	                          (a2 (cadr args)))
	                        (if (equal? type1 type2)      ;new
	                            raise-error
	                            (cond 
	                            	(	(raise-til type1 type2) 
	                            		(apply-generic op (raise-til type1 type2) type2)
	                            	)
	                            	( 	(raise-til type2 type1)
	                            		(apply-generic op type1 (raise-til type2 type1))
	                            	)
	                            	(else raise-error)
	                            )
	                        )
	                    )
	                   	raise-error
	                )
				)
			)
		)
	)
)

;---2.85---

(define (drop x) 
	(let ((proc (get 'project (type-tag x))))
		(if proc 
			(let ((drop-num (proc (contents x))))
				(if (equal? x (raise drop-num))
					(drop drop-num)
					x
				)
			)
			x
		)
	)
)
(put 'project 'complex  
	(lambda (x) (if (= (imag-part x) 0) (make-real (real-part x)) false)))
(put 'project 'real
	(lambda (x) (let ((rat (rationalize (inexact->exact x) 1/100))) 
		(make-rational (numer x) (denom x))
	)) 
)
(put 'project 'rational
	(lambda (x) (make-scheme-number (round (/ (numer x) (demon x)))))
)

;replace with apply-generic

(drop (apply proc (map contents args)))

;---2.86---	直接复制网上的，只是大致思路，意思不大

;;; add into global 
 (define (sine x) (apply-generic 'sine x)) 
 (define (cosine x) (apply-generic 'cosine x)) 
 (define (arctan x) (apply-generic 'arctan x)) 
 (define (exp x y) (apply-generic 'exp x y)) 
  
 ;;; add into rational package  
   (put 'sine '(number) (lambda (x) (tag (sin x)))) 
   (put 'cosine '(number) (lambda (x) (tag (cos x)))) 
   (put 'arctan '(number) (lambda (x) (tag (atan x)))) 
   (put 'exp '(number number) (lambda (x y) (tag (expt x y)))) 
  
 ;;; complex-rect package  
   (define (square x) (mul x x)) 
   (define (sqrt x) (exp x 0.5)) 
   (define (make-from-mag-ang r a) (cons (mul r (cosine a)) (mul r (sine a)))) 
   (define (magnitude z) (sqrt (add (square (real-part z)) (square (imag-part z))))) 
   (define (angle z) (arctan (div (imag-part z) (real-part z)))) 
  
 ;;; complex-polar package  
   (define (real-part z) (mul (magnitude z) (cosine (angle z)))) 
   (define (imag-part z) (mul (magnitude z) (sine (angle z)))) 

 ;;; complex package  
 (define (add-complex z1 z2) 
   (make-from-real-imag (add (real-part z1) (real-part z2)) 
                        (add (imag-part z1) (imag-part z2)))) 
 (define (sub-complex z1 z2) 
   (make-from-real-imag (sub (real-part z1) (real-part z2)) 
                        (sub (imag-part z1) (imag-part z2)))) 
 (define (mul-complex z1 z2) 
   (make-from-mag-ang (mul (magnitude z1) (magnitude z2)) 
                      (add (angle z1) (angle z2)))) 
 (define (div-complex z1 z2) 
   (make-from-mag-ang (div (magnitude z1) (magnitude z2)) 
                      (sub (angle z1) (angle z2)))) 
