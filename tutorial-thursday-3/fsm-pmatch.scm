;;; fsm-pmatch.scm - Pattern match on states and bits
(load "pmatch.scm")
(define fsm (lambda (str)
  (define fsm-aux (lambda (str S)
    (let ((bit (car str)))
      (pmatch (list S bit)
    ;;; Row S0
      [(S0 0) 'S0]
    [(S0 1) 'S1]
      ;; Row S1
    [(S1 0) 'S2]
    [(S1 1) 'S0]
    ;;; Row S2
    [(S2 0) 'S1]
    [(S2 1) 'S2]
    ;;; Else reject
        [else 'REJECT]
      )
    )

  ))
  (fsm-aux str 'S0)
))



