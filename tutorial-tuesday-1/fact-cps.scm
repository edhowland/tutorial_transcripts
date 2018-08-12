;; factorial using CPS
(define (fact n)
  (define (fact-cps num k)    
    (cond
      [(zero? num) (k 1)]
      [else (fact-cps (sub1 num) (lambda (v)
        (k (* num v))))])
  )

  (fact-cps n (lambda (v) v))
)



