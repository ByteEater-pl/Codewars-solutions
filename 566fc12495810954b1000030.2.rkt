#lang racket
(provide nb-dig)

(define (nb-dig n d)
  (for*/sum
    ([k (+ n 1)]
     [c (~a (* k k))])
    (if (= (- (char->integer c) 48) d) 1 0)))
