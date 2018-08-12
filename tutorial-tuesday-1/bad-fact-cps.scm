;; bad fact non tail call cps?

(define fact-cps
  (lambda (n k)
    (cond
      [(zero? n) (k 1)]
      [else (fact-cps (sub1 n) (lambda (v) (k (* n (k v)))))])))
