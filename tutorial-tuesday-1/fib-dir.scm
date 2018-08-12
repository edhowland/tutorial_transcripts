;; fib - direct way
(define (sub2 n) (sub1 (sub1 n)))
(define (fib n)
  (cond
  [(zero? n) 1]
    [(= n 1) 1]
  [else (+ (fib (sub2 n)) (fib (sub1 n)))]))
