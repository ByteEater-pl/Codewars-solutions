#|
The code in 54d496788776e49e6b00052f.6.rkt, using mutable lists, works fast enough to pass the tests at Codewars.
This one doesn't, which indicated that, surprisingly, Racket isn't optimized for functional style as well as it's for imperative.
Disappointing.
|#

#lang racket
(provide sum-of-divided)

(define primes
  (letrec
    ([ps
      (stream*
        2
        (for*/stream
          ([i (in-naturals 3)]
           #:unless
             (for/or
               ([p ps])
               #:break (< i (sqr p))
               (= 0 (modulo i p))))
        i))])
    ps))

(define (sum-of-divided lst)
  (for/fold
    ([l lst]
     [a '()]
     #:result (reverse a))
    ([d primes])
    #:break (null? l)
    (values
      (remq*
        '(1)
        (map
          (λ (x)
             (let exhaust ([s x])
               (define q (/ s d))
               (if (integer? q)
                   (exhaust q)
                   s)))
          l))
      `(,@(for/fold
          ([t '(0 #f)]
           #:result
             (if (cadr t)
                 `((,d ,(car t)))
                 '()))
          ([n lst])
           (if (= 0 (modulo n d))
               `(,(+ (car t) n) #t)
               t))
        ,@a))))
