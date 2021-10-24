#lang racket
(provide totient)

(define (totient n [i 2] [s 0])
  (define (f m l)
    (filter (λ (x) (= 0 (modulo m x))) l))
  (define (go m l)
    (if (null? l)
        m
        (let ([r (f m l)])
             (go (/ m (apply * r)) r))))
  (if (< n (sqr i))
      (let*
        ([ds (f n (sequence->list s))]
         [k (go n ds)])
        (foldl
          (λ (p a) (- a (/ a p)))
          n
          `(,@(if (= k 1) '() `(,k)) ,@ds)))
      (totient
        n
        (+ i 1)
        (if (for/or
              ([d s])
              #:break (< i (sqr d))
              (= 0 (modulo i d)))
            s
            (sequence-append s `(,i))))))
