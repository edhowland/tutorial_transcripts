(call-with-current-continuation
 (lambda (k)
   (with-exception-handler (lambda (x)
                             (display "condition: ")
                             (write x)
                             (newline)
                             (k 'exception))
     (lambda ()
       (+ 1 (raise 'an-error))))))
PRINTS: condition: an-error
=> exception

(call-with-current-continuation
 (lambda (k)
   (with-exception-handler (lambda (x)
                             (display "something went wrong")
                             (newline)
                             'dont-care)
     (lambda ()
       (+ 1 (raise 'an-error))))))
PRINTS: something went wrong
then behaves in an unspecified way

(guard (condition
         (else
          (display "condition: ")
          (write condition)
          (newline)
          'exception))
  (+ 1 (raise 'an-error)))
PRINTS: condition: an-error
=> exception

(guard (condition
         (else
          (display "something went wrong")
          (newline)
          'dont-care))
 