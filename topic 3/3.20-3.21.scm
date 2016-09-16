(define nil '())
;---3.19---

(define (make-queue) (cons nil nil))
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front! queue item) (set-car! queue item))
(define (set-rear! queue item) (set-cdr! queue item))
(define (empty-queue? queue) (null? (front-ptr queue)))
(define (front-queue queue)
	(if (empty-queue? queue)
		(error "call empty queue")
	)
	(car (front-ptr queue))
)
(define (insert-queue queue item)
	(let ((new-pair (cons item nil)))
		(cond 
			((empty-queue? queue)
				(set-front! queue new-pair)
				(set-rear! queue new-pair)
				queue
			)
			(else 
				(set-cdr! (rear-ptr queue) new-pair)
				(set-rear! queue new-pair)
				queue
			)
		)
	)
)
(define (delete-queue queue)
	(if (empty-queue? queue)
		(error "to delete a empty queue")
		(begin (set-front! queue (cdr (front-ptr queue)))
			queue
		)
	)
)

(define (print-queue queue)
	(if (empty-queue? queue)
		nil
		(car queue)
	)
)

;---3.22---

(define (make-queue)
	(let ((front nil) (rear nil))
		(define queue (cons front rear))
		(define (empty?) (null? front))		
		(lambda (dispatch)
			(cond 
				((eq? dispatch 'insert)
					(lambda (item)
						(let ((new-pair (cons item nil)))
							(cond 
								((empty?) (set! front new-pair) 
									(set! rear new-pair) queue)
								(else 
									(set-cdr! rear new-pair)
									(set! rear new-pair)
									queue
								)
							)
						)
					)
				)
				((eq? dispatch 'delete)
					(cond 
						((empty?) (error "to delete a empty queue"))
						(else (set! front (cdr front)) queue)
					)
				)
				(else (error "no such selection"))				
			)
		)
	)
)

;---3.23---		下面代码没看懂。。。这题留 表 之后试试

(define (make-deque) (cons nil nil))
(define (front-deque deque) (car deque))
(define (rear-deque deque) (cdr deque))
(define (empty-deque? deque) (null? (front-deque deque)))
(define (combine-nodes node1 node2)	
	(set-cdr! (car node1) temp)
	(set-car! (car node2) node1)
)
(define (print-deque d) 
   (define (iter res _d) 
     (if (or (null? _d) (empty-deque? _d)) res 
       (iter (append res (list (caaar _d))) (cons (cdar _d) (cdr d))))) 
   (iter nil d)) 
(define (front-insert-deque deque item)
	(let ((new-node (cons (cons item nil) nil)))
		(cond 
			((empty-deque? deque) 
				(set-front! deque new-node) (set-rear! deque new-node)
				(print-deque deque)
			)
			(else 
				;(combine-nodes new-node (front-deque deque))
				;(set-cdr! new-node (front-deque deque))
				;(set-cdr! (car (front-deque deque)) new-node)
				;(set-front! deque new-node)
				;(print-deque deque)
				(set-cdr! new-node (front-deque deque)) 
            	(set-cdr! (car (front-deque deque)) new-node) 
            	(set-front! deque new-node)
            	;(print-deque deque)
            	deque
			)
		)
	)
)
;...