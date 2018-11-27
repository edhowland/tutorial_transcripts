(define x (lambda (str)
  (if (null? str) 'accecpt
  (case (car str)
  [1 #t]
  [else #f]
  )
  )
))

