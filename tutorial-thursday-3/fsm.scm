(define fsm (lambda (str)
  (define fsm-aux (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
      ;;; Row S0
      [(and (eq? st 'S0) (zero? (car str))) 'S0]
      [(and (eq? st 'S0) (eq? (car str) 1)) 'S1]
      ;;; Row S1
      [(and (eq? st 'S1) (eq? (car str) 0)) 'S2]
      [(and (eq? st 'S1) (eq? (car str) 1)) 'S2]
      ;;; Row S2
      [(and (eq? st 'S2) (eq? (car str) 0)) 'S1]
      [(and (eq? st 'S2) (eq? (car str) 1)) 'S2]

    [else 'REJECT]
  )
  ))
  (fsm-aux str 'S0)
))
