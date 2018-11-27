(define chekr (lambda (op e1 e2 ex)
  (assert (equal? (op e1 e2) ex))
))
