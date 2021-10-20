#lang racket
(provide rank)

(define (rank st we n)
  (define fs (string-split st ","))
  (cond
    [(null? fs) "No participants"]
    [(> n (length fs)) "Not enough participants"]
    [#t
     (cadr (list-ref
       (sort
         (for/list
           ([f fs]
            [w we])
           `(,(* w (apply -
                (* 63 (string-length f))
                (map char->integer (string->list (string-upcase f)))))
             ,f))
         (lambda (x y)
           (or
             (< (car x) (car y))
             (and (= (car x) (car y)) (string-ci<? (cadr x) (cadr y))))))
      (- n 1)))]))
