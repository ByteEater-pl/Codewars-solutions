#lang racket
(provide step)

(define ps (mcons 2 '()))
(define t ps)

(define (step g m n)
  (define l ps)
  (define u 2)
  (define (gen)
    (set! u (+ u 1))
    (define b
      (for*/and
        ([r `(,(integer-sqrt u))]
         [p ps])
        #:break (> p r)
        (< 0 (modulo u p))))
    (when b
      (set! l
        (let go ([a l])
          (if
            (or
              (>= (mcar a) (- u g))
              (null? (mcdr a)))
            a
            (go (mcdr a)))))
      (when (> u (mcar t))
        (set-mcdr! t (mcons u '()))
        (set! t (mcdr t))))
    b)
  (for ([_ (range u (+ m g -1))]) (gen))
  (let go ()
    (cond
      [(= u n) '()]
      [(and (gen) (= (- u g) (mcar l)))
       (cons (- u g) u)]
      [#t (go)])))
