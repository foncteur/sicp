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

(define (sqrt-bis x) (sqrt-iter-bis 1.0 2.0 x))

; Exercise 8
(define (good-enough? guess y) (< (abs (- (* guess (* guess guess)) y)) 0.01))

(define (improve-cube guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)
  )

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-root-iter (improve-cube guess x) x)))

(define (cube-root x) (cube-root-iter 1.O x))

; Exercise 9

; With the first program
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
; this is a recursive process

; With the second program
; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ 2 7)
; (+ (dec 2) (inc 7))
; (+ 1 8)
; (+ (dec 1) (inc 8))
; (+ 0 9)
; 9
; this is an iterative process

; Exercise 10

(define (A x y) (cond ((= y 0) 0) ((= x 0) (* 2 y))
((= y 1) 2) (else (A (- x 1) (A x (- y 1))))))

; (A 1 10)
; (A (- 1 1) (A 1 (- 10 1)))
; (A 0 (A 1 9))
; (* 2 (A 1 9))
; (* 2 (A (- 1 1) (A 1 (- 9 1))))
; (* 2 (A 0 (A 1 8)))
; (* 2 (* 2 (A 1 8)))
; ...
; 1024

; (A 2 4)
; 65536

; (A 3 3)
; 65536

; (f n) computes 2*n
; (g n) computes 2^n
; (h n) computes (A 2 n) = (A 1 (A 2 (n-1))) = 2^(A 2 (n-1)) so (h n) = 2^2^...^2 (n times)
; (k n) computes 5n^2
