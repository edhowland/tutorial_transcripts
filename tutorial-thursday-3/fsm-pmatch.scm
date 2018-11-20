;;; fsm-pmatch.scm - Pattern match on states and bits
(load "pmatch.scm")
(define fsm (lambda (str)
  (define fsm-aux (lambda (str S)
    (let ((bit (car str)))
      (pmatch '(S bit)
        ['(S0 0) 'S0]
        [else 'REJECT]
      )
    )

  ))
  (fsm-aux str 'S0)
))



