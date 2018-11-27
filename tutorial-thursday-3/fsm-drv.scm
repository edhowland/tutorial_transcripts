;;; fsm-drive.scm - moves recursion from helper fsm-aux to driver: fsm
(load "fsm-aux.scm")

(define fsm-drv (lambda (lst S)

  (let ((R (fsm-aux lst S)))
      (cond
        [(eq? R 'ACCEPT) 'ACCEPT]
        [(eq? R 'REJECT) 'REJECT]
        [else (fsm-drv (cdr lst) R)]
      ))
))


