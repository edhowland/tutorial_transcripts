;; Transcript reconstructed from the video
;;
;; Tutorial Tuesday #1: Intro to continuations, call/cc, and CPS
;;
;; Streamed live on Apr 9, 2013
;;
;; YouTube link:
;;
;; https://www.youtube.com/watch?v=2GfFlfToBCo
;;
;; Thanks to Ed Howland for the transcript request, which I should have posted earlier.
;;
;; Happy hacking!
;;
;; --Will

;; time 8:50
(+ (* v 4) 5)

;; time 9:45
(+ (* 3 4) 5)

;; time 10:13
;; showing how the expression can be evaluated

(+ 12 5)

17

;; time 10:57
(+ (* _ 4) 5)

(+ (* ? 4) 5)

;; time 13:02
(+ (* v 4) 5)

;; time 13:28
(let ([v 3])
  (+ (* v 4) 5))

;; time 13:40
(let ([v 2])
  (+ (* v 4) 5))

;; time 13:44
(let ([v 4])
  (+ (* v 4) 5))

;; time 14:01
(let ([v 3])
  (+ (* v 4) 5))

;; time 14:25
((lambda (v)
   (+ (* v 4) 5))
 3)

;; time 14:53
(lambda (v)
  (+ (* v 4) 5))

;; time 15:19
(+ (* v 4) 5)

;; time 15:25
(+ (* 3 4) 5)

;; time 15:56
(+ (* (expt 2 3) 4) 5)

;; time 16:05
;; once again pointing to
(lambda (v)
  (+ (* v 4) 5))

;; time 16:34
5

;; time 16:50
(lambda (v) v)

;; time 18:03
(+ (* 3 4) 5)

;; time 18:20
(+ _ 5)

;; time 18:31
(lambda (v)
  (+ v 5))

;; time 19:37
(+ _ 5)

;; time 32:25
(+ (* 3 4) 5)

;; time 32:58
(+ (call/cc
     (lambda (k)
       ))
   5)

;; time 33:14
;; once again pointing to
(lambda (v)
  (+ v 5))

;; time 33:31
(+ (call/cc
     (lambda (k)
       (* 3 4)))
   5)

;; time 34:05
(+ (call/cc
     (lambda (k)
       (k (* 3 4))))
   5)

;; time 35:06
(+ (call/cc
     (lambda (k)
       (begin
         (set! *k* k)
         (k (* 3 4)))))
   5)

;; time 35:16
*k*

;; time 35:28
;; once again pointing to
(lambda (v)
  (+ v 5))

;; time 35:40
(*k* (* 3 4))

;; time 35:44
(*k* 12)

;; time 35:49
(*k* 20)

;; time 36:41
(call/cc
  (lambda (k)
    (/ 5 0)))

;; time 37:02
(call/cc
  (lambda (k)
    (/ 5 (k 0))))

;; time 37:25
(call/cc
  (lambda (k)
    (display "foo")))

;; time 37:34
(call/cc
  (lambda (k)
    (display (k "foo"))))

;; time 38:00
(call/cc
  (lambda (k)
    (error (k "foo"))))

;; time 39:09
;; once again pointing to
(+ (* 3 4) 5)

;; time 39:41
(+ (* 3 4) 5)  ;; k: (lambda (v) v)

;; time 40:16
(* 3 4)  ;; k: (lambda (v) (+ v 5))

;; time 40:38
3  ;; k: (lambda (v) (+ (* v 4) 5))

;; time 40:53
4  ;; k: (lambda (v) (+ (* 3 v) 5))

;; time 41:17
5  ;; k: (lambda (v) (+ (* 3 4) v))

;; the full table of expressions and their continuations:
(+ (* 3 4) 5)  ;; k: (lambda (v) v)
(* 3 4)        ;; k: (lambda (v) (+ v 5))
3              ;; k: (lambda (v) (+ (* v 4) 5))
4              ;; k: (lambda (v) (+ (* 3 v) 5))
5              ;; k: (lambda (v) (+ (* 3 4) v))

;; time 42:17
;; once again pointing to
(+ (* 3 4) 5)

;;; Additions made by Ed Howland ed.howland@gmail.com
;; time 51:00
;; https://www.scheme.com/tspl4/further.html#g63
;; The following is from Section 3.3 Continuations


;; Why does this work? Can you trace its path? 
;; time 52:42

(let ([x (call/cc (lambda (k) k))])
  (x (lambda (ignore) "hi")))
;; time 1:02:00
;; => "HI"


;; Continuation Passing Style
;; time 1:11:40

;; time 1:17:00
;; Direct style Factorial
(define (fact n) (if (zero? n) 1 (* n (fact (- n 1)))))


;; time 1:18:00
;; ... trace output showing triangular stack build-up
;; time 1:21:00
;; Factorial in Accumulator Passing Style
(define (fact num)
  (define (fact-aps n acc)
    (if (zero? n) acc (fact-aps (- n 1) (* acc n))))
  (fact-aps num 1))

;;;



;; (fact 5)
;; => 120
;; time 1:22:00
;; trace ooutput showing straight line, and no stack buildup

;; time 1:26:00
;; Factorial Continuation Passing Style

;; factorial using CPS
;; factorial using CPS
;; On the video, the lambda is shown as the greek letter Lambda
(define (fact n)
  (define (fact-cps n k)    
    (cond
      [(zero? n) (k 1)]
      [else
        (fact-cps (sub1 n) (lambda (v)
          (k (* n v))))])
  )

  (fact-cps n (lambda (v) v))
)



;; (fact 5)
;; 120


