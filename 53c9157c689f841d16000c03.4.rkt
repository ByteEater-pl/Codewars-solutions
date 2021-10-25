#lang racket
(provide totient)

(define (totient n)
  (define (go m i a f)
    (if (< n (sqr i))
        `(,f ,m)
        (let ([q (/ m i)])
             (if (integer? q)
                 (go q i #t
                    (if a f (sequence-append f `(,i))))
                 (go m (+ i 1) #f f)))))
  (match-let ([`(,d, k) (go n 2 #f 0)])
    (foldl
      (λ (p a) (- a (/ a p)))
      n
      `(,@(if (= k 1) '() `(,k)) ,@(sequence->list d)))))
