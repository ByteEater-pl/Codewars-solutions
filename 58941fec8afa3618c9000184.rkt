#lang racket
(provide growing-plant)

(define (growing-plant up-speed down-speed desired-height)
  (max
    (ceiling (/ (- desired-height down-speed) (- up-speed down-speed)))
    1))
