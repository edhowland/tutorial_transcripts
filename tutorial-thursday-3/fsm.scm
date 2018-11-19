;;; fsm.scm - Encode delta function of DFA in helper: fsm-aux
(define fsm (lambda (str)
  (define fsm-aux (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
      [(null? str) 'REJECT]
      ;;; Row S0
      [(and (eq? st 'S0) (zero? (car str))) (fsm-aux (cdr str) 'S0)]
      [(and (eq? st 'S0) (eq? (car str) 1)) (fsm-aux (cdr str) 'S1)]
      ;;; Row S1
      [(and (eq? st 'S1) (eq? (car str) 0)) (fsm-aux (cdr str) 'S2)]
      [(and (eq? st 'S1) (eq? (car str) 1)) (fsm-aux (cdr str) 'S2)]
      ;;; Row S2
      [(and (eq? st 'S2) (eq? (car str) 0)) (fsm-aux (cdr str) 'S1)]
      [(and (eq? st 'S2) (eq? (car str) 1)) (fsm-aux (cdr str) 'S2)]

    [else 'REJECT]
  )
  ))
  (fsm-aux str 'S0)
))
