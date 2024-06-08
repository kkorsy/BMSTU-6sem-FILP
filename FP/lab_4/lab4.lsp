;; 1. Каковы результаты вычисления следующих выражений?
(setf lst1 '(a b c))
(setf lst2 '(d e))
(cons lst1 lst2)        ;; --> ((a b c) d e)
(list lst1 lst2)        ;; --> ((a b c) (d e))
(append lst1 lst2)      ;; --> (a b c d e)

;; 2. Каковы результаты вычисления следующих выражений?
(reverse '(a b c))      ;; --> (c b a)
(reverse '(a b (c (d))));; --> ((c (d)) b a)
(reverse '(a))          ;; --> (a)
(reverse ())            ;; --> Nil
(reverse '((a b c)))    ;; --> ((a b c))

(last '(a b c))         ;; --> (c)
(last '(a))             ;; --> (a)
(last '((a b c)))       ;; --> ((a b c))
(last '(a b (c)))       ;; --> ((c))
(last ())               ;; --> Nil

;; 3. Написать, по крайней мере, 2 варианта функции, которая возвращает последний элемент своего списка-аргумента
(defun f3-1(lst)
    (car (reverse lst)))
(defun f3-2(lst)
    (cond ((= (length lst) 1)
                (car lst))
          (T (f3-2 (cdr lst)))))

;; 4. Написать, по крайней мере, 2 варианта функции, которая возвращает свой список-аргумент без последнего элемента
(defun f4-1(lst)
    (reverse (cdr (reverse lst))))
(defun f4-2(lst)
    (cond ((> (length lst) 1)
                (cons (car lst) (f4-2 (cdr lst))))))

;; 5. Написать функцию swap-first-last, которая переставляет переставляет в списке-аргументе первый и последний элементы
(defun f5(lst)
    (let ((a (first lst))
          (b (car (last lst))))
        (reverse (rplaca (reverse (rplaca lst b)) a))))

;; 6. Написать простой вариант игры в кости
(defun throw-dices-1()
    (and (setf s1 (+ 1 (random 5))) (setf s2 (+ 1 (random 5)))))
(defun throw-dices-2()
    (and (setf s3 (+ 1 (random 5))) (setf s4 (+ 1 (random 5)))))
(defun is-winner(a b)
    (or (= 7 (+ a b)) (= 11 (+ a b))))
(defun is-retry(a b)
    (or (and (= a 1) (= b 1)) (and (= a 6) (= b 6))))
(defun print-throw(a b)
    (and (print 'throw) (print a) (print b) T))

(defun f6()
    (cond ((and (throw-dices-1) (print-throw s1 s2) (is-winner s1 s2))
                'player_1_won)
          ((is-retry s1 s2)
                (f6))
          ((and (throw-dices-2) (print-throw s3 s4) (is-winner s3 s4))
                'player_2_won)
          ((> (+ s1 s2) (+ s3 s4))
                'player_1_won)
          ((< (+ s1 s2) (+ s3 s4)) 
                'player_2_won)
          (T 'draw))
)

;; 7. Написать функцию, которая по своему списку-аргументу определяет является ли он палиндромом
(defun cmp(lst1 lst2)
    (cond ((and (= 1 (length lst1)) (= 1 (length lst2)))
            (eq (car lst1) (car lst2)))
          ((not (eq (car lst1) (car lst2)))
            Nil)
          (T (cmp (cdr lst1) (cdr lst2)))))

(defun f7(lst)
    (cmp lst (reverse lst)))

;; 8. Написать свои необходимые функции, которые обрабатывают таблицу из 4х точечных пар
(defun my-assoc(el tbl)
    (cond ((= 0 (length tbl))
                Nil)
          ((eq (caar tbl) el)
                (car tbl))
          (T (my-assoc el (cdr tbl)))))

(defun my-rassoc(el tbl)
    (cond ((= 0 (length tbl))
                Nil)
          ((eq (cdar tbl) el)
                (car tbl))
          (T (my-rassoc el (cdr tbl)))))

;; 9. Написать функцию, которая умножает на заданное число-аргумент первый числовой элемент списка из заданного 3х элементного списка-аргумента, когда а) все элементы списка --- числа; б) элементы списка --- любые объекты.
(defun f9-1(n lst)
    (rplaca lst (* n (car lst))))
(defun f9-2(n lst)
    (cond ((= 0 (length lst))
            Nil)
          ((numberp (car lst))
                (rplaca lst (* n (car lst))))
          (T (f9-2 n (cdr lst)))))
          