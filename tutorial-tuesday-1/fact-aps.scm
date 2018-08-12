;; fact in accumulator passing style
(define (fact num)
  (define (fact-aps n acc)
    (cond
      [(zero? n) acc]
      [else (fact-aps (sub1 n) (* acc n))]))

  (fact-aps num 1)
)



