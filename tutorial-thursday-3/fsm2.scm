(define fsm-aux (lambda (str state)
  (if (null? str) 'reject
    (let ([d (cdr str)])
      (pmatch (list state (car str))
      [(S0 0) (fsm-aux d 'S0)]
      )
  )
  )
))


