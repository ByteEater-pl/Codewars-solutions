#lang racket
(provide decompose)                                                                    

(define (decompose s)
  (define n
    (if (number? s)
        s
        (string->number s 10 'number-or-false 'decimal-as-exact)))
  (define (f x) `(,(number->string x) ,@(decompose (- n x))))
  (cond
    [(= 0 n) '()]
    [(> 1 n) (f (/ 1 (ceiling (/ 1 n))))]
    [#t (f (floor n))]))
