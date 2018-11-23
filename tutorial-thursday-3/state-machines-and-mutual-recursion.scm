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
;;; Time: 00:59:00
;;; Note: The nex function: fsm probably would be the result completing
;;; The cond version of the delta function. Before moving on to the pmatch version.
;;; fsm.scm - Encode delta function of DFA in helper: fsm-aux
(define fsm (lambda (str)
  (define fsm-aux (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
      [(null? str) 'REJECT]
      ;;; Row S0
      [(and (eq? st 'S0) (zero? (car str))) (fsm-aux (cdr str) 'S0)]
      [(and (eq? st 'S0) (eq? (car str) 1)) (fsm-aux (cdr str) 'S1)]
      ;;; Row S1
      [(and (eq? st 'S1) (eq? (car str) 0)) (fsm-aux (cdr str) 'S2)]
      [(and (eq? st 'S1) (eq? (car str) 1)) (fsm-aux (cdr str) 'S0)]
      ;;; Row S2
      [(and (eq? st 'S2) (eq? (car str) 0)) (fsm-aux (cdr str) 'S1)]
      [(and (eq? st 'S2) (eq? (car str) 1)) (fsm-aux (cdr str) 'S2)]

    [else 'REJECT]
  )
  ))
  (fsm-aux str 'S0)
))

;;; Note: This version, not covered in the talk, implements an outer, driver and
;;; the delta function. The recursion occurs in the fsm-drv function.
;;; fsm-drive.scm - moves recursion from helper fsm-aux to driver: fsm


(define fsm-drv (lambda (lst S)

  (let ((R (fsm-aux lst S)))
      (cond
        [(eq? R 'ACCEPT) 'ACCEPT]
        [(eq? R 'REJECT) 'REJECT]
        [else (fsm-drv (cdr lst) R)]
      ))
))
;;; fsm.scm - Encode delta function of DFA in helper: fsm-aux

  (define fsm-aux (lambda (str st)
    (cond
      [(and (null? str) (eq? st 'S0)) 'ACCEPT]
      [(null? str) 'REJECT]
      ;;; Row S0
      [(and (eq? st 'S0) (zero? (car str))) 'S0]
      [(and (eq? st 'S0) (eq? (car str) 1)) 'S1]
      ;;; Row S1
      [(and (eq? st 'S1) (eq? (car str) 0)) 'S2]
      [(and (eq? st 'S1) (eq? (car str) 1)) 'S0]
      ;;; Row S2
      [(and (eq? st 'S2) (eq? (car str) 0))  'S1]
      [(and (eq? st 'S2) (eq? (car str) 1)) 'S2]
      ;;; Reject all other conditions
    [else 'REJECT]
  )
  ))


;;; fsm-cond.scm - Conditional version of DFA


(define  fsm (lambda (lst)
  (let* ((Q0 'S0) (Q Q0))
  (fsm-drv lst Q)
  )
))


;;; Time: ??:??:??
;;;  Pmatch version: Use pattern matcher to perform check for valid  bit strings
(load "pmatch.scm")

(define fsm-aux (lambda (str state)
  (if (null? str) (if (eq? state 'S0) 'accept 'reject)
    (let ([bit (car str)] [d (cdr str)])
      (pmatch (list state bit)
;;; TEMP:       [(S0 0) (fsm-aux d 'S0)]
    ;;; Row S0
      [(S0 0) (fsm-aux d 'S0)]
    [(S0 1) (fsm-aux d 'S1)]
      ;; Row S1
    [(S1 0) (fsm-aux d 'S2)]
    [(S1 1) (fsm-aux d 'S0)]
    ;;; Row S2
    [(S2 0) (fsm-aux d 'S1)]
    [(S2 1) (fsm-aux d 'S2)]
      )
  )
  )
))




(define fsm (lambda (ls)
  (fsm-aux ls 'S0)
))




;;; Time: 01:22:00
(define fsm-ho (lambda (str)
  (letrec (
  [S0 (lambda (str) 
  (if  (null? str) 'accept  
      (let ([bit (car str)] [d (cdr str)])
      (case bit
  [0 (S0 d)]
  [1 (S1 d)]
  )
  )
    )
)]
  [S1 (lambda (str) 
  (if  (null? str) 'reject
      (let ([bit (car str)] [d (cdr str)])
      (case bit
        [0 (S2 d)]
        [1 (S0 d)]
  )
  )
    )
)]
  [S2 (lambda (str) 
  (if  (null? str) 'reject
      (let ([bit (car str)] [d (cdr str)])
      (case bit
        [0 (S1 d)]
        [1 (S2 d)] 
      )
  )
    )
)]
  )
  (S0 str)
  )
))


;;; (fsm-ho '(1 0 1))
;;; => reject
;;; (fsm-ho '(1 0 0 1))
;;; => accept


;;; Time: 01:??:??
;;; State bit version. Each state function takes a bit and returns new state function.
;;; The internal driver function churns its way thru the bit list and calls
;; each state in  in turn. When the end of the list is reached reached, it calls
;;; the current state with special end of list bit: 'end
;;; Each state function does a case on the bit and either returns the next state
;;; or if the 'end bit, whether it is in the 'accept or 'reject state

;;; fsm-bit.scm
(define fsm-bit (lambda (str)
  (define fsm-aux (lambda (state str)
    (if (null? str) (state 'end)
  (fsm-aux (state (car str)) (cdr str)))
 ))

  (fsm-aux (letrec (
  [S0 (lambda (bit) 
      (case bit
      [0 S0]
      [1 S1]
  [else 'accept])
)]
  [S1 (lambda (bit) 
      (case bit
        [0 S2]
        [1 S0]
        [else 'reject]
  )
)]
  [S2 (lambda (bit) 
      (case bit
        [0 S1]
        [1 S2]
        [else 'reject]
      )
)]



  )
  S0
  )  str)
))



;;; Time: 01:??:??
;;; End of transcription
;;; Further video works on miniKanren version from here.



