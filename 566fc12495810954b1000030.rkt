#lang racket
(provide nb-dig)

(define (nb-dig n d)
  (for/sum
    ([k (range (+ n 1))])
    (count
      (curry string=? (~r d))
      (string-split (~r (* k k)) ""))))
