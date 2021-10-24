#lang racket
(provide totient)

(define (totient n [i 2] [s 0])
  (if (< n i)
      (sequence-fold
        (λ (a p)
           (if (= 0 (modulo n p))
               (- a (/ a p))
               a))
        n
        s)
      (totient
        n
        (+ i 1)
        (if (for/or
              ([d s])
              #:break (< i (sqr d))
              (= 0 (modulo i d)))
            s
            (sequence-append s `(,i))))))
