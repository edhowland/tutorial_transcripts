;; fact-cps.scm - from: https://cgi.soic.indiana.edu/~c311/doku.php?id=cps-refresher

(define fact-cps
  (lambda (n k)
    (cond
      [(zero? n) (k 1)]
      [else (fact-cps (sub1 n) (lambda (v)
                                 (k (* n v))))])))


