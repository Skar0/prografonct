#!r6rs

(import (rnrs lists (6))
        (rnrs base (6))
        (rnrs io simple (6)))

(define (f n) (+ 1 n))

(define pi1 3.141516) ;on definit une variable pi

(define (pi2) 3.141516) ; on definit une procedure pi qui une fois appellee renvoit la valeur, pour l'appeller faut donner (pi2), pi2 contient le fait que c'est une proc

(define (tiers n) (/ n 3)) ; division par 3. Appelle avec 5 ca donne une notation exacte, 5.0 une notation inexacte. On peut aussi faire (exact->inexact fonction) pour qu'elle renvoie du inexact


