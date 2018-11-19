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
(letrec (
  [even? (lambda (n)
  (cond
    [(zero? n) #t]
    [else (odd? (sub1 n))]
))]
  [odd? (lambda (n)
  (cond
    [(zero? n) #f]
    [else (even? (sub1 n))]
))]
  )
  ;;; Now call it
(even? 101)
)
;;; => #t
;;; Time: ??:??:??
;;; Now let's return both functions in a list
(define e-o 
(letrec (
  [even? (lambda (n)
  (cond
    [(zero? n) #t]
    [else (odd? (sub1 n))]
))]
  [odd? (lambda (n)
  (cond
    [(zero? n) #f]
    [else (even? (sub1 n))]
))]
  )
  ;;; Now call it
  (list even? odd?)
)
)
;;; Time: ??:??:??

;;; > ((car e-o) 9)
;;; #f
;;; > ((cadr e-o) 9)
;;; #t

;;; Time: ??:??:??
;;; Finite State Machines
;;; A Deterministic Finite Autamata or DFA can be defined by a 5-Tuple
;;;https://en.wikipedia.org/wiki/Deterministic_finite_automaton
;;; This diagram represents a DFA which accepts any multiple of 3 1-bits
;;; From a string of 0s and 1s alphabet.
;;; Q: [S0 S1 S2]:  List of states : 
;;; Accept state: S0   ;;; When empty string or end of input
;;;  Sigma:Alphabet: [0 1]  ;;; Any number of 0s or 1s - encoded in a llist
;;; Delta fn: Transition function:
;;; Q X Sigma -> Q
;;; F : [S0] : Set of accept states
;;; Q[0] Start state: S0
;;; State transition table
;;; State | 0 | 1 |
;;; S0 | S0 | S1 |
;;; S1 | S2 | S0 |
;;; S2 | S1 | S2 |
;;; Amozon link: https://www.amazon.com/Introduction-Theory-Computation-Michael-Sipser/dp/113318779X/ref=mp_s_a_1_1?ie=UTF8&qid=1542647886&sr=8-1&pi=AC_SX236_SY340_QL65&keywords=introduction+to+theory+of+computation&dpPl=1&dpID=41HYcr8ZodL&ref=plSrch
;;; Page 35 of Sipser: A DFA is represented as a a 5-Tuple
;;;



