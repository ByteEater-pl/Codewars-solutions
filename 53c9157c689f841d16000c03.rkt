#lang racket
(provide totient)

(define (totient n [m #f] [d 2])
  (if (= n 1)
      1
      (let ([k (or m (/ n d))]
            [f (curryr totient #f (+ d 1))])
           (if (integer? k)
               (let ([j (/ k d)])
                    (if (integer? j)
                        (* d (totient k j d))
                        (* (- d 1) (f k))))
               (f n)))))
