;---3.24---

(define (make-table same-key?)
	(let ((local-table (list '*table*)))
		(define (assoc key records)
			(cond 
				((null? records) false)
				((same-key? key (caar records)) (car records))
				(else (assoc key (cdr records)))
			)
		)
		(define (look-up key1 key2)
			(let ((subtable (assoc key1 (cdr local-table))))
				(if subtable
					(let ((record (assoc key2 (cdr subtable))))
						(if record
							(cdr record)
							false
						)
					)
					false
				)
			)
		)
		(define (insert! key1 key2 value)
			(let ((subtable (assoc key1 (cdr local-table))))
				(if subtable 
					(let ((record (assoc key2 (cdr subtable))))
						(if record 
							(set-cdr! record value)
							(set-cdr! subtable (cons (cons key2 value) (cdr subtable)))
						)
					)
					(set-cdr! local-table (cons (list key1 (cons key2 value)) (cdr local-table)))
				)
			)
		)
		(lambda (dispatch)
			(cond 
				((equal? dispatch 'insert!) insert!)
				((equal? dispatch 'look-up) look-up)
				(else (error "UNKNOWN OPERATION"))
			)
		)
	)
)

;---3.25---
(define (insert! key-list value table)
	(if (list? key-list)
		(let ((current-key (car key-list)) (remain-key (cdr key-list)))
			(let ((record (assoc current-key (cdr table))))
				(cond 
					((and (null? remain-key) record) 
						(set-cdr! record value)
						table
					)
					((and (not (null? remain-key)) record) 
						(insert! remain-key value record)
						table
					)
					((not (null? remain-key))						
						(join-in-table 
							(insert! remain-key value (make-table current-key)) 
							table
						)
						table
					)
					(else (join-in-table (cons current-key value) table) table)
				)
			)
		)
		(insert! (list key-list) value table)
	)
)
(define (look-up key-list table)
	(if (list? key-list)
		(let ((current-key (car key-list)) (remain-key (cdr key-list)))
			(let ((record (assoc current-key (cdr table))))
				(if record 
					(if (null? remain-key)
						(cdr record)
						(look-up remain-key record)
					)
					false
				)
			)
		)
		(look-up (list key-list) table)
	)
)
(define (join-in-table node table)
	(set-cdr! table (cons node (cdr table)))
)
(define (make-table . tablename) 
	(if (null? tablename) (list '*table*) tablename)
)
(define (assoc key table)
	(cond 
		((null? table) false)
		((equal? (caar table) key) (car table))
		(else (assoc key (cdr table)))
	)
)

;---3.26---
;...


