;; factorial using CPS
(define (fact n)
(define (fact-cps num k)
  (if (zero? num) (k 1) 
    (* num (call/cc (lambda (cc) (fact-cps (- num 1) cc))))  )
)
  (call/cc (lambda (v) (fact-cps n v)))
)

