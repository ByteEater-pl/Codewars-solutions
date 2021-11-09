#lang racket
(provide sum-of-divided)

(define (sum-of-divided lst)
  (define ps (mcons 0 '()))
  (define t ps)
  (for*/list
    ([m
      (let go ([n 2] [l (map abs lst)])
        (if (null? l)
            (mcdr ps)
            (go
              (+ n 1)
              (if
                (for/or
                  ([p (mcdr ps)])
                  #:break (< n (sqr p))
                  (= 0 (modulo n p)))
                l
                (begin
                  (set-mcdr! t (mcons n '()))
                  (set! t (mcdr t))
                  (append-map
                    (λ (x)
                       (let exhaust ([s x])
                         (define q (/ s n))
                         (cond
                           [(= s 1) '()]
                           [(integer? q) (exhaust q)]
                           [#t `(,s)])))
                    l))))))]
     [s `(,(for/fold
       ([a '(0 #f)])
       ([x lst])
       (if (= 0 (modulo x m))
           `(,(+ (car a) x) #t)
           a)))]
     #:when (cadr s))
    `(,m ,(car s))))
