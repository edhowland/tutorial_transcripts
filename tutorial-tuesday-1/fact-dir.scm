;; fact in direct style
(define (fact n)
  (cond
    [(zero? n) 1]
    [else (* n (fact (sub1 n)))])
)


