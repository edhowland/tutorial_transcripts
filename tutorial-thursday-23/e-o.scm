(define (even n)
  (if (zero? n) #t
  (odd (sub1 n)))
)

(define (odd n)
  (cond
  [(zero? n) #f]
  [(eq? 1 n) #t]
  [else (even (sub1 n))])
)
