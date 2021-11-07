#lang racket
(provide solution)

(define (solution xs)
  (define (go a b l)
    (define (s)
      (map ~a
        (match (- b a)
          [0 `(,a)]
          [1 `(,a ,b)]
          [_ `(,(format "~a-~a" a b))])))
    (match l
      [`(,h ,@t)
       (if (= (+ b 1) h)
           (go a (+ b 1) t)
           `(,@(s) ,@(go h h t)))]
      [_ (s)]))
  (match xs
    [`(,h ,@t)
     (string-join (go h h t) ",")]
    [_ ""]))
