#lang racket
(provide solution)
 
(define (solution xs)
  (string-join (map ~a xs) ","))
