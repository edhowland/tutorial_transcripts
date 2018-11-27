
(guard (condition
  ((equal? condition 3) #t)
         (else
          (display "something went wrong")
          (newline)
          'dont-care))
  (+1 2 3))

