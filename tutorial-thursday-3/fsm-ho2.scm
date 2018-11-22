(define fsm-ho (lambda (str)
  (letrec (
  [S0 (lambda (str) 
  (if  (null? str) 'accecpt
      (let ([bit (car str)] [d (cdr str)])
      (case bit
  [0 (S0 d)]
  [1 (S1 d)]
  )
  )
    )
)]
  [S1 (lambda (str) 
  (if  (null? str) 'reject
      (let ([bit (car str)] [d (cdr str)])
      (case bit
        [0 (S2 d)]
        [1 (S0 d)]
  )
  )
    )
)]
  [S2 (lambda (str) 
  (if  (null? str) 'accecpt
      (let ([bit (car str)] [d (cdr str)])
      d
  )
    )
)]
  )
  (S0 str)
  )
))
