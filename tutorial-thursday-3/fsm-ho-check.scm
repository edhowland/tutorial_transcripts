;;; fsm-ho-check.scm - Use chekr* to check for valid state transitions
(load "chekr-star.scm")
(load "fsm-ho.scm")
;;; helper method
(define fsm-dbg (lambda (ls)
  (display "got:")   (write ls)
  (fsm ls)
))


(chekr* fsm-ho '(
  [(()) accept]
  [((1 0 1)) reject]
  [((1 0 0 1)) accept]
  [((1 1 0)) accept]
  [((1 1 1)) reject]
  [((0 0 0 0 0 0 0 0)) accept]
  [((1 1 1 1 1 1 1 1 1)) reject]
  [((1 0 1 1 1 1 1 1)) reject]
))

(display "ok")
(exit)
