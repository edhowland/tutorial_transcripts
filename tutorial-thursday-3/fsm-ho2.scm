(define fsm-ho (lambda (str)
  (letrec (
  [S0 (lambda (str) 
  (if  (null? str) 'accecpt
      (let ([bit (car str)] [d (cdr str)])
      d
  )
    )
)]
  [S1 (lambda (str) 
  (if  (null? str) 'accecpt
      (let ([bit (car str)] [d (cdr str)])
      d
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
