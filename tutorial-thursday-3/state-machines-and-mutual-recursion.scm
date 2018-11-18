;;  Tutorial Thursday #3 - State machines and mutual recursion

;; Time: 00:09:47
(define multi-rember (lambda (x ls)
  (cond
  [(null? ls) '()]
  )
))

;;; Time: 00:14:41

;;; > (multi-rember 2 '())
;;; ()
;;; > (multi-rember 2 '(2))
;;; > (list (multi-rember 2 '(2)))
;;; (#<void>)
;; > 


;;; (mu

;;; Time: 00:19:01
(define multi-rember (lambda (x ls)
  (cond
  [(null? ls) '()]
  [(eq? (car ls) x) (multi-rember x (cdr ls))]
  [else (multi-rember x (cdr ls))]
  )
))
 (define l '(y z x y))


;;; Time: 00:19:53

;;; > (multi-rember 'x '())
;;; ()
;;; (multi-rember 'y l)
;;; ()

;;; Time: 00:24:40
(define multi-rember (lambda (x ls)
  (cond
  [(null? ls) '()]
  [(eq? (car ls) x) (multi-rember x (cdr ls))]
  [else (cons (car ls) (multi-rember x (cdr ls)))]
  )
))

;;; Time: 00:24:45

;;; > (multi-rember 'y l)
;;; (z x)

;;; Time: 00:29:00
;;; Mutual recursion with even?/odd?

;;; Time: 00:29:31

> (define even? (lambda (n)
                  (cond
                    [(zero? n) #t]
                    [else #f]
                    )))
> (define odd? (lambda (n)
                 (cond
                   [(zero? n) #f]
                   [else #t]
                   )))

;;; Time ??:??:??
(define even? (lambda (n)
  (cond
    [(zero? n) #t]
    [else (odd? (sub1 n))]
  )
))
(define odd? (lambda (n)
  (cond
    [(zero? n) #f]
    [else (even? (sub1 n))]  )
))





;;; Time 00:37:00
;;; The let construct
(let ((x (+ 3 2)))
  (* x x)
)

;;; Time ??:??:??
;;; left-left-lambda equiv to let
((lambda (x) (* x x)) (+ 3 2))

;;; Time 00:40:00
;;; Using letrec for factorial

(letrec (
  [fact (lambda (n)
    (cond
      [(zero? n) 1]
      [else (* n (fact (sub1 n)))]
    ))])
(fact 5)
)

;;; Time: ??:??:??
;;; Redo our even?/odd? example with letrec instead of top-level functions



