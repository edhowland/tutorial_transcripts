;; chekr1.scm - splat operator for chekr
;;; display helper: println
(define (println str) (display str) (newline))
(define chekr1 (lambda (fn args xpct)
;   (display "(chekr1 ")(write args)(write xpct) 
  (assert (equal? (apply fn args) xpct))
))
