#lang racket
(provide race)

(define (race v1 v2 g)
  (define (f x) (* 60 (- x (floor x))))
  (if (< v1 v2)
      (let ([t (/ g (- v2 v1))])
           `(
             ,(floor t)
             ,(floor (f t))
             ,(floor (f (f t)))))
      '()))
