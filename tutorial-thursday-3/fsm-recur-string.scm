;;; fsm-recur-string.scm - Version #1 of mutually recursive state functions
;;; Each state function takes a string
(define S0 (lambda (str)
  (if (null? str) 'accecpt
  (case (car str)
  [0 (S0 (cdr str))]
  [1 (S1 (cdr str))]
  [else #f]
  )
  )

))


(define S1 (lambda (str)
  (if (null? str) 'reject
  (case (car str)
  [0 (S2 (cdr str))]
  [1 (S0 (cdr str))]
  [else #f]
  )
  )


))


(define S2 (lambda (str)
  (if (null? str) 'reject
  (case (car str)
  [0 (S1 (cdr str))]
  [1 (S2 (cdr str))]
  [else #f]
  )
  )


))
