#lang racket
(provide nb-dig)

(define (nb-dig n d)
  (sequence-count
    (curry eq? (integer->char (+ d 48)))
    (string-join (for/list
      ([k (range (+ n 1))])
      (~r (* k k))))))
