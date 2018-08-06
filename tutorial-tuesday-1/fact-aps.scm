(define (fact num)
  (define (fact-aps n acc)
    (if (zero? n) acc (fact-aps (- n 1) (* acc n)))
  )
  (fact-aps num 1)
)

