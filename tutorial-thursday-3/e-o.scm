;;; e-o.scm - even?/odd? mutually recursive
(define even? (lambda (n)
  (cond
    [(zero? n) #t]
    [else (odd? (sub1 n))]
)))
(define odd? (lambda (n)
  (cond
    [(zero? n) #f]
    [else (even? (sub1 n))]
)))


