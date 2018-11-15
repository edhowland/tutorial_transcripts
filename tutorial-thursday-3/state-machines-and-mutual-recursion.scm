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




