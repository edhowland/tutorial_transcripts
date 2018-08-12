;; fact - wrapper around fact-cps with one time fn
(load "f2.scm")
(define (fact n)
  (let ((once #f))
    (define (one-time v) 
  (cond
    [once (error "cannot call me more than once")]
  [else (begin
    (set! once #t)
  v)]))
  (fact-cps n one-time)
  )
)



