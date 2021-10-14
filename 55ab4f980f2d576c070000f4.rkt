#lang racket
(provide game)

(define (game n)
  (if (odd? n)
      `(,(* n n) 2)
      `(,(/ (* n n) 2))))
