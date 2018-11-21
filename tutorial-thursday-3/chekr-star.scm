;;; chekr-star - fn: chekr* wraps many tests for function
(load "chekr1.scm")
;;; chekr* fname list-of-args-expection-pairs
(define chekr* (lambda (fn tests)
  (cond
    [(null? tests) #t]
    [else 
      (let* ([tst (car tests)] [args (car tst)] [xpct (cadr tst)])
        (chekr1 fn args xpct)
  )
      (chekr* fn (cdr tests))
    ]
  )
))
