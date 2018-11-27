
(guard (condition
         (else
          (display "condition: ")
  (write condition)
          (newline)
          'dont-care))
  (+1 (raise 'an-error) 3))

