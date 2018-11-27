;;; interleave-check.scm
(load "chekr-star.scm")
(load "interleave.scm")

(chekr* interleave '(
  [(() ()) ()]
  [((foo) (bar)) (foo bar)]
  [((foo bar) (1 2)) (foo 1 bar 2)]
  [((foo) ()) (foo)]
  [(() (bar)) (bar)]
  [((foo bar baz) ()) (foo bar baz)]
  [(() (baz bar foo)) (baz bar foo)]
  [((foo bar baz) (1 2)) (foo 1 bar 2 baz)]
  [((foo) (1 2 3)) (foo 1 2 3)]
  ))


(println "ok")

