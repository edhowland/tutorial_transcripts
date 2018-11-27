;;; let-e-o.scm - letrec version of even?odd? mutually recurring functions.
(letrec (
  [even? (lambda (n)
  (cond
    [(zero? n) #t]
    [else (odd? (sub1 n))]
))]
  [odd? (lambda (n)
  (cond
    [(zero? n) #f]
    [else (even? (sub1 n))]
))]
  )
  ;;; Now call it
(even? 101)
)
