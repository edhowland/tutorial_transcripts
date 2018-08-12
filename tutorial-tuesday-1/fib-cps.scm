;; CPS ver of fib

(define (fib-cps n k)
  (cond
    [(zero? n) (k 0 1)]
    [(= n 1) (k 0 1)]
    [else (fib-cps (sub1 n) (lambda (x y)
                                (k y (+ x y))))]
  )
)

(define (fib m) (fib-cps m (lambda (x y) (+ x y))))