#lang racket
(provide decompose)                                                                    

(define (decompose s)
  (define (f x) `(,(number->string x) ,@(decompose (- s x))))
  (cond
    [(string? s)
     (decompose (string->number s 10 'number-or-false 'decimal-as-exact))]
    [(= 0 s) '()]
    [(> 1 s) (f (/ 1 (ceiling (/ 1 s))))]
    [#t (f (floor s))]))
