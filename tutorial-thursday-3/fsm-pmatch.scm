(load "pmatch.scm")

(define fsm-aux (lambda (str state)
  (if (null? str) (if (eq? state 'S0) 'accept 'reject)
    (let ([bit (car str)] [d (cdr str)])
      (pmatch (list state bit)
;;; TEMP:       [(S0 0) (fsm-aux d 'S0)]
; ---
    ;;; Row S0
      [(S0 0) (fsm-aux d 'S0)]
    [(S0 1) (fsm-aux d 'S1)]
      ;; Row S1
    [(S1 0) (fsm-aux d 'S2)]
    [(S1 1) (fsm-aux d 'S0)]
    ;;; Row S2
    [(S2 0) (fsm-aux d 'S1)]
    [(S2 1) (fsm-aux d 'S2)]
; ---
      )
  )
  )
))




(define fsm (lambda (ls)
  (fsm-aux ls 'S0)
))
