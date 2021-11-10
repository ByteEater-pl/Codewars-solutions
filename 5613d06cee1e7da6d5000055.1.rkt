#lang racket
(provide step)

(define ps (mcons 2 '()))
(define t ps)
(define (step g m n)
  (define w ps)
  (let go ([x 3])
    (define d (- x g))
    (set!
      w
      (let slide ([s w])
        (cond
          [(null? s) w]
          [(< (mcar s) d) (slide (mcdr s))]
          [#t s])))
    (define q (integer-sqrt x))
    (cond
      [(> (modulo (* m n) 100) 0) 0]
      [(> x n) '()]
      [(for/or
         ([p ps])
         #:break (< q p)
         (= 0 (modulo x p)))
       (go (+ x 1))]
      [(and (>= d m) (= d (mcar w)))
       (cons (mcar w) x)]
      [#t
       (set-mcdr! t (mcons x '()))
       (set! t (mcdr t))
       (go (+ x 1))])))
