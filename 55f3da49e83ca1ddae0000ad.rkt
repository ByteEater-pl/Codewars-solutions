#lang racket
(provide tank-vol)

(define (tank-vol h d vt)
  (exact-floor (* (/ vt pi)
    (let ([c (- 1 (/ h d .5))])
      (- (acos c) (* c (sqrt (- 1 (* c c)))))))))
