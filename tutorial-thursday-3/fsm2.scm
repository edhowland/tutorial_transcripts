(define fsm (lambda (str)
  (define fsm-aux (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
    [else 'REJECT]
  )
  ))
  (fsm-aux str 'S0)
))
