

(define empty-k (lambda (v) v))

(define fact-cps
  (lambda (n k)
     <CPSed fact body goes here>))

(define fact
  (lambda (n)
    (fact-cps n empty-k)))


