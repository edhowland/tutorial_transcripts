;;; fsm-bit.scm
(define fsm-bit (lambda (str)
  (define fsm-aux (lambda (state str)
    (if (null? str) (state 'end)
  (fsm-aux (state (car str)) (cdr str)))
 ))

  (fsm-aux (letrec (
  [S0 (lambda (bit) 
      (case bit
      [0 S0]
      [1 S1]
  [else 'accept])
)]
  [S1 (lambda (bit) 
      (case bit
        [0 S2]
        [1 S0]
        [else 'reject]
  )
)]
  [S2 (lambda (bit) 
      (case bit
        [0 S1]
        [1 S2]
        [else 'reject]
      )
)]



  )
  S0
  )  str)
))
