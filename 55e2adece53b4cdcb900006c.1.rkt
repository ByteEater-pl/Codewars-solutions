#lang racket
(provide race)

(define (race v1 v2 g)
  (if (< v1 v2)
      (let
        ([t (/ g (- v2 v1))])
        (reverse (map
          (λ (f) (floor (f t)))
          (stream-fold
            (λ (a g) `(,(compose g (car a)) ,@a))
            `(,identity)
            (stream-take
              (sequence->stream
                (in-cycle `(,(λ (x) (* 60 (- x (floor x)))))))
              2)))))
      '()))
