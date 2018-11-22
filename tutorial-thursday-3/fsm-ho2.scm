(define fsm-ho (lambda (str)
  (letrec (
  [S0 (lambda (str) str)]
  [S1 (lambda (str) str)]
  [S2 (lambda (str) str)]
  )
  (S0 str)
  )
))
