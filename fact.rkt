#lang racket 

(require racket/trace)

;(define (fact n) 
;  (if (= n 1)
;      1
;      (* n (fact (- n 1)))
;      )
;  )
;
;(trace fact) ; pour tracer les appels recursifs
;(fact 7)

(define (fact n) 
  (define (iter n acc)
    (if (= n 1)
        acc
        (iter (- n 1) (* n acc)))
    )
  (begin ; on commence et on dit ce qu'on veut tracer, ici une var locale
    (trace iter)
    (iter n 1)
    )
  )


(trace fact) ; pour tracer les appels recursifs
(fact 7)