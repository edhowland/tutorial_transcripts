;;; interleave.scm - given 2 lists, return list interleaving every other item
(define interleave (lambda (l s)
  (cond
    [(and (null? l) (null? s) '())]
;;    [(null? l) s]
;;    [(null? s) l]
    [else (cons (car l) (cons (car s) (interleave (cdr l) (cdr s))))]
  )
))
