
(list
  (call/cc
    (lambda (k)
      (vector
        (with-exception-handler
          (lambda (x) (k (+ x 5)))
          (lambda () (+ (raise 17) 8)))))))
