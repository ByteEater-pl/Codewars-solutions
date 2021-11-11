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
     [r '()]
     #:result (reverse r))
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
          ([a 0]
           [f #f]
           #:result
             (if f
                 `((,d ,a))
                 '()))
          ([n lst])
           (if (= 0 (modulo n d))
               (values (+ a n) #t)
               (values a f)))
        ,@r))))
