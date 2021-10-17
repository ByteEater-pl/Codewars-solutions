#lang racket
(provide dec->fact-string fact-string->dec)

(define (dec->fact-string nb)
  (define (go n k s)
    (if (> n 0)
        (let-values
          ([(q r) (quotient/remainder n k)])
          (go
            q
            (+ k 1)
            (string-append (~r r #:base '(up 36)) s)))
        s))
  (go nb 1 ""))

(define (fact-string->dec strg)
  (for/fold
    ([n 0] [k 1] [f 1]
     #:result n)
    ([d (reverse (string->list strg))])
    (values
      (+ n (* f (- (char->integer d) (if (char-numeric? d) 48 55))))
      (+ k 1)
      (* k f))))
