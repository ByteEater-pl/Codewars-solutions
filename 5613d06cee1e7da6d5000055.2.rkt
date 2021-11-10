#lang racket
(provide step)

(define ps
  (letrec
    ([s
      (stream*
        2
        (for*/stream
            ([n (in-naturals 3)]
             #:unless
               (for/or
                 ([p s])
                 #:break (< n (sqr p))
                 (= 0 (modulo n p))))
          n))])
    s))
(define (step g m n)
  (define t
    (let advance ([l ps])
      (if (> m (stream-first l))
          (advance (stream-rest l))
          l)))
  (let go ([b t] [e t])
    (let
      ([x (stream-first b)]
       [y (stream-first e)])
      (if (> y n)
          '()
          (match (sgn (- y x g))
            [-1 (go b (stream-rest e))]
            [0 (cons x y)]
            [1 (go (stream-rest b) e)])))))
