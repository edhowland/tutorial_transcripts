;;; fsm.scm - Encode delta function of DFA in helper: fsm-aux

  (define fsm-aux (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
      [(null? str) 'REJECT]
      ;;; Row S0
      [(and (eq? st 'S0) (zero? (car str))) 'S0]
      [(and (eq? st 'S0) (eq? (car str) 1)) 'S1]
      ;;; Row S1
      [(and (eq? st 'S1) (eq? (car str) 0)) 'S2]
      [(and (eq? st 'S1) (eq? (car str) 1)) 'S0]
      ;;; Row S2
      [(and (eq? st 'S2) (eq? (car str) 0))  'S1]
      [(and (eq? st 'S2) (eq? (car str) 1)) 'S2]

    [else 'REJECT]
  )
  ))
