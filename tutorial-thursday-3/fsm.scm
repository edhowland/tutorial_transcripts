;;; fsm.scm - encode our finite state machine
(define fsm (lambda (str)
  (define fsm-aux  (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
      [(and (eq? st 'S0) (zero? (car str))) 'S0]
      [else 'REJECPT]
  )))
))



