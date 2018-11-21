;; chekr1.scm - splat operator for chekr
(define chekr1 (lambda (fn args xpct)
  (assert (equal? (apply fn args) xpct))
))
