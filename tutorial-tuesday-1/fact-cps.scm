;; factorial using CPS
(define (fact n)
  (define (fact-cps n k)    
    (cond
      [(zero? n) (k 1)]
      [else (fact-cps (sub1 n) (lambda (v)
        (k (* n v))))])
  )

  (fact-cps n (lambda (v) v))
)



