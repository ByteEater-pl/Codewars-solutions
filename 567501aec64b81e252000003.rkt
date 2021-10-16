#lang racket
(provide wallpaper)

(define (wallpaper l w h)
  (list-ref
    (list 0 "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen" "twenty")
    (inexact->exact (ceiling (*
      (sgn (* l w h))
      23/52
      (+ l w)
      h)))))
