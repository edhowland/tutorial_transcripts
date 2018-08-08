
(let ([x (call/cc (lambda (k) k))])
  (x (lambda (ignore) "hi")))
