(load "chekr.scm")
(load "interleave.scm")

(chekr interleave '() '() '())
(chekr interleave '(foo) '(bar) '(foo bar))
 (chekr interleave '(foo bar) '(1 2) '(foo 1 bar 2))
(chekr interleave '(foo) '() '(foo))
(chekr interleave '() '(bar) '(bar))
(chekr interleave '(foo bar baz) '() '(foo bar baz))
;

(chekr interleave '() '(baz bar foo) '(baz bar foo))
(chekr interleave '(foo bar) '(1) '(foo 1 bar))
(chekr interleave '(foo) '(1 2 3) '(foo 1 2 3))

(println "ok")

