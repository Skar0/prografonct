#lang racket

;exo 1.1

;x variable
;(= y z) egalite entre x et y
;(3 + 4) mauvaise syntaxe : (+ 3 4)
;sin(0) mauvaise syntaxe : (sin 0)
;(= (= y z) 0) on ne peut pas comparer des types différents
;(define (f x) x) une fonction qui renvoie x
;(define (f x) y) ici y peut ne pas être défini, sinon ça ne fait que renvoyer y
;(define (f ’x) x) ici il ne reconnait pas x, il ne comprend pas que 'x et x sont liés. Il me dit donc qu'il ne trouve pas le x
;(define (f) 10) renvoie 10
;(f) si f ne prend pas de param ca marche
;(define (f #t) 4) on doit donner en toute lettre le booleen dont on parle, ça renvoie 4

;exo 1.2

;(+ +) on donne une procedure au lieu d'un nombre (mais on peut ne donner qu'un param)
;(define (f n) (+ (/ n 3) 2)) on divise n par 3 et on ajoute 2
;(+ 5 (/ 1 0)) erreur : div par 0
;(sin 10 20) erreur : un arg de trop
;(define (mafonction x) (sin x x))
;(mafonction 10 20)
;(mafonction 10)

;exo 1.4

;(not (or (= 3 4) (= 5 6))) (3=4 ou 5=6) faux donc avec le not c'est vrai
;(+ 2 (if (> a b) a b)) si a>b renvoie a, sinon renvoie b. Ici a n'est pas plus grand que b donc on renvoie b. Ensuite on comme avec 2, ça donne 6

;exo 1.5

;(if (and (> b a) (< b (* a b))) b a) Si (b>a et b<(a*b)) retourne b sinon a
;((if (< a b) + -) a b) Si a<b alors retourne +, sinon retourne - et ensuite applique la fonction sur a et b. Ici on aura (+ 3 4)

;(cond ((= 1 1) "waaw 1") on ne rentre que dans une seule des conditions (la premiere vraie rencontree)
;((= 2 2) "waaw 2")
;((= 3 3) "waaw once more")
;(else "waaw final"))

;(* (cond ((> a b) a) On multiplie a+1 avec une des trois cond qui est vraie (ou le default) ici a<b donc on fera b*(a+1)
;        ((< a b) b)
;        (else -1))
;(+ a 1))

;exo 2.1

;Elles ne sont pas evaluees dans le meme ordre que les fonctions

;exo 2.2

;(define (celcius-to-fahrenheit C) (- (* 1.8 (+ C 40) ) 40 ) )
;(define (fahrenheit-to-celcius F) (- (/ (+ F 40) 1.8) 40) )

;exo 2.3

;(and #f (/ 1 0)) faux (faux & qqchose)
;(and #t (/ 1 0)) erreur car ici vu qu'on (vrai & qqchose) on evalue le qqchose qui est une div par 0
;(if #t 2 (/1 0)) on retourne 2 (et on s'arrête là, on ne regarde pas après)
;(if #f 2 (/ 1 0)) erreur car on veut retourner une div par 0
;(and #t #t #f (/ 1 0)) (vrai & vrai & faux) on s'arrête au faux et on n'evalue pas plus loin
;(and #t #t #t (/ 1 0)) ici on va essayer d'evaluer la div par 0

;exo 2.4

;(define et (lambda (cond1 cond2) (and cond1 cond2))) ici on évalue les lambda tout de suite et ensuite on teste les conditions. Pour le and c'est evalue dans l'ordre.
;(and #f (/ 1 0))
;(et #f (/ 1 0))

;exo 3.1

;(define test (lambda (a b) (+ a b)))

;exo 3.2

;18

;exo 3.3

;Vu que les évaluations des var dans le let sont faite en parallèle et pas dans un ordre précis, x n'est pas connu lors du (y (* 2 x)) car x n'a pas encore été alloué bien qu'il soit avant dans les definitions
;Une solution est d'utiliser le let* qui est séquenciel (c'est fait dans l'ordre de gauche a droite et donc le x sera connu lorsqu'il sera utilisé pour définir y)
;Une autre solution est de définir x avant et donc lorsque (* 2 x) sera appellé, ce sera le x défini précédemment qui sera appellé

;exo 3.4

;Le programme inverse x et y et les affiche, on remarque que les x et y du let sont liés à ceux de la définition de la fonction et pas à ceux défini au dessus en tant que variables.
;Si on utilise let* alors on dit que "dans x on met la valeur de y" et ensuite on dit "dans y on met la valeur de x" qui est y. Essentiellement on se retrouve avec x et y qui valent tout les deux y

;exo 3.5

;Ca sort #f#t#t#f. Le principe du letrec c'est qu'on peut utiliser le deuxième truc dans le premier. ex : (letrec (x (+x y)) (y 2) x)