(define fsm-aux (lambda (str state)
  (if (null? str) (if (eq? state 'S0) 'accept 'reject)
    (let ([bit (car str)] [d (cdr str)])
      (pmatch (list state bit)
      [(S0 0) (fsm-aux d 'S0)]
      )
  )
  )
))


