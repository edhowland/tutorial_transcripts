;;; fsm-ho.scm - FSM Higher Order
(define fsm-ho (lambda (str)
  (letrec (
    [S0  (lambda (str)
  (if (null? str) 'accecpt
  (case (car str)
  [0 (S0 (cdr str))]
  [1 (S1 (cdr str))]
  [else #f]
  )
  )
      )]
      [S1  )(lambda (str)
  (if (null? str) 'reject
  (case (car str)
  [0 (S2 (cdr str))]
  [1 (S0 (cdr str))]
  [else #f]
  )
  )
             )]
      [S2   (lambda (str)
  (if (null? str) 'reject
  (case (car str)
  [0 (S1 (cdr str))]
  [1 (S2 (cdr str))]
  [else #f]
  )
  )
        )]
    (S0 str)
  )
))
