;;; my-let - macro of let binding form
(print-gensym #f)
(define-syntax my-let
  (syntax-rules ()
  ((my-let ((x e)) body)
  ((lambda (x) body) e))
  ))


