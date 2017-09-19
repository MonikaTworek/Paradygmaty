(define (append-map f xs)
  (concat (map f xs)))

(define (concat lists)
  (cond ((null? lists) '())
        (else (append (car lists) (concat (cdr lists))))))

(define (splot2 list1 list2)
  (append-map (lambda (x) (map (lambda (y) (list x y)) list2)) list1))

;(define (splot first . rest)
;  (cond ((null? rest) (map list first))
;        ((null? (cdr rest)) (splot2 first (car rest)))
;        (else (append-map (lambda (x) (map (lambda (y) (cons x y)) (apply splot rest))) first))))

(define (splot . lists)
  (cond ((null? lists) '())
        ((null? (cdr lists)) (map list (car lists)))
        ((null? (cddr lists)) (splot2 (car lists) (cadr lists)))
        (else (append-map (lambda (x) (map (lambda (y) (cons x y)) (apply splot (cdr lists)))) (car lists)))))

