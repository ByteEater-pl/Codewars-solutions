#lang racket
(provide solution)

(define (solution lst)
  (* (apply gcd lst) (length lst)))
