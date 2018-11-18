;;; let-fact.scm - letrec version of factorial
(define x
(letrec (
  [fact (lambda (n)
    (cond
      [(zero? n) 1]
      [else (* n (fact (sub1 n)))]
    ))])
(fact 5)
)





)
