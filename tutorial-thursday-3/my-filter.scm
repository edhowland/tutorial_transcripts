;;; filter.scm - return copy of list with only elements where predicate is true
(define my-filter (lambda (p ls)
  (cond
  [(null? ls) '()]
    [(p (car ls)) (cons (car ls) (my-filter p (cdr ls)))]
  [else (my-filter p (cdr ls))]
  )
))

