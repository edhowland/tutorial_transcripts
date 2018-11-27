
(guard (condition
         (else
          (display "something went wrong")
          (newline)
          'dont-care))
  (+1 2 3))

