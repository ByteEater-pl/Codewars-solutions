#lang racket
(provide tank-vol)

(define (tank-vol h d vt)
  (define c (- 1 (/ h d .5)))
  (exact-floor (*
    (/ vt pi)
    (- (acos c) (* c (sqrt (- 1 (* c c))))))))
