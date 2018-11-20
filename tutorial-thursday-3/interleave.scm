;;; interleave.scm - given 2 lists, return list interleaving every other item
(define interleave (lambda (l s)
  (cond
    [(and (null? l) (null? s) '())]
    [(null? l) (cons (car s) (interleave '() (cdr s)))]
    [(null? s) (cons (car l) (interleave (cdr l) '()))]
    [else (cons (car l) (cons (car s) (interleave (cdr l) (cdr s))))]
  )
))
