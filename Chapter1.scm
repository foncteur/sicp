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
