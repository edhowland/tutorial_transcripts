;;; fsm-cond.scm - Conditional version of DFA
(load "fsm-drv.scm")

(define  fsm (lambda (lst)
  (let* ((Q0 'S0) (Q Q0))
  (fsm-drv lst Q)
  )
))
