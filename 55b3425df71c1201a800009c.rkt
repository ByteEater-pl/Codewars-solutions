#lang racket
(provide stat)

(define (stat strg)
  (define l
    (map
      (λ (x)
         (apply + (map *
           '(3600 60 1)
           (map string->number (string-split x "|")))))
      (string-split strg #rx", ?")))
  (define-values (q r) (quotient/remainder (- (length l) 1) 2))
  (writeln (list l q r))
  (if
    (non-empty-string? strg)
    (apply format "Range: ~a Average: ~a Median: ~a"
      (map
        (λ (n)
           (string-join
             (map
               (curry ~r #:min-width 2 #:pad-string "0")
               `(,(quotient n 3600)
                 ,(quotient (modulo n 3600) 60)
                 ,(modulo n 60)))
             "|"))
        `(,(- (apply max l) (apply min l))
          ,(quotient (apply + l) (length l))
          ,(quotient
            (apply + (take (drop (sort l <) q) (+ r 1)))
            (+ r 1)))))
    "")
)
