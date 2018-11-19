(load "chekr.scm")
(load "fsm-aux.scm")

;;; check empty
(chekr fsm-aux '() 'S0 'ACCEPT)
(chekr fsm-aux '() 'S1 'REJECT)
(chekr fsm-aux '() 'S2 'REJECT)
;;; Check out of bounds for q [S0 S1 S2]
(chekr fsm-aux '() 'S9 'REJECT)


(exit)
