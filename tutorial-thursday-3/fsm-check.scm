;;; fsm-check.scm - Checks delta function: fsm-aux
;;; State | 0 | 1 |
;;; S0 | S0 | S1 |
;;; S1 | S2 | S0 |
;;; S2 | S1 | S2 |



(load "chekr.scm")
(load "fsm-aux.scm")

;;; check empty
(chekr fsm-aux '() 'S0 'ACCEPT)
(chekr fsm-aux '() 'S1 'REJECT)
(chekr fsm-aux '() 'S2 'REJECT)
;;; Check out of bounds for q [S0 S1 S2]
(chekr fsm-aux '() 'S9 'REJECT)
;;; Row S0
(chekr fsm-aux '(0) 'S0 'S0) 
(chekr fsm-aux '(1) 'S0 'S1)
;;; Row S1
(chekr fsm-aux '(0) 'S1 'S2)
(chekr fsm-aux '(1) 'S1 'S0)
;;; Row S2
(chekr fsm-aux '(0) 'S2 'S1)
(chekr fsm-aux '(1) 'S2 'S2)


(display "ok")
(exit)

