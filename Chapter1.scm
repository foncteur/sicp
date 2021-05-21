; Exercise 1

;10
;12
;8
;3
;6
;a
;b
;19
;#f
;4
;16
;6
;16

; Exercise 2


(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7))
)


; Exercise 3

(define (square x) (* x x))
(define (sum-two-square x y) (+ (square x) (square y)))

(define (sum-three-square x y z)
        (cond ((and (> x z) (> y z)) (sum-two-square x y))
              ((and (> x y) (> z y)) (sum-two-square x z))
              (else (sum-two-square y z))
        )
)

; Exercise 4

; the part (if (> b 0) + -) returns an operator, depending on the sign of b
; the whole function returns a + abs(b)

; Exercise 5

; an interpreter that uses normal-order evaluation will return 0
; an interpreter that uses applicative-order evaluation will not return anything and
; will be stuck in an infinite loop

; Exercise 6

; the program never stops
; because scheme uses applicative-order evaluation, and new-if is a function
; so is evaluates all arguments before applying the function

; Exercise 7

; For very small numbers, a poor guess can be accepted because a 0.001 is not a lot;
; for example, sqrt(0.0025)=0.05, but 0.045 is considered a good enough approximation

; For very large numbers, 0.001 is too precise because the computation of
; the square of the current guess can be more than 0.001 from the real value
; so it's not helpful to demand such a precision

(define (average x y) (/ (+ x y) 2))

(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? x y) (< (abs (- x y)) 0.001))

(define (sqrt-iter-bis old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
    new-guess
    (sqrt-iter-bis new-guess (improve new-guess x) x)))
