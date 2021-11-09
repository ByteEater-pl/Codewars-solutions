#lang racket
(provide sum-of-divided)

(define (sum-of-divided lst)
  (for*/list
    ([m
      (let go ([ps '()] [n 2] [l (map abs lst)])
        (if (null? l)
            ps
            (if
              (for/or
                ([p ps])
                #:break (< n (sqr p))
                (= 0 (modulo n p)))
              (go ps (+ n 1) l)
              (go
                `(,@ps ,n)
                (+ n 1)
                (filter
                  (curry < 1)
                  (map
                    (λ (x)
                       (let exhaust ([s x])
                         (define q (/ s n))
                         (if (integer? q) (exhaust q) s)))
                    l))))))]
     [s `(,(for/fold
       ([a '(0 #f)])
       ([x lst])
       (if (= 0 (modulo x m))
           `(,(+ (car a) x) #t)
           a)))]
     #:when (cadr s))
    `(,m ,(car s))))
