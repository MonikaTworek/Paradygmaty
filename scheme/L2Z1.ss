(define mymap 
	(lambda (fun ls)
		(cond ((null? ls) '())
			  (else (cons (fun (car ls)) (mymap fun (cdr ls)))))))
