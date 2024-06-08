;; 1. Функция my-reverse, которая разворачивает верхний уровень своего списка-аргумента
(defun _my-reverse(lst res)
    (cond ((null lst) res)
          (t (_my-reverse (cdr lst) (cons (car lst) res)))))

(defun my-reverse(lst)
    (_my-reverse lst Nil))

;; 2. Функция, которая возвращает первый элемент списка-аргумента, который сам является непустым списком
(defun first-element(lst)
    (cond ((atom lst) lst)
          (t (first-element (car lst)))))

;; 3. Функция, которая выбирает из заданного списка только те числа, которые между 1 и 10
(defun is-between-1-10(x)
    (and (numberp x) 
         (and (< x 10) (> x 1))))

(defun select-between-1-10(lst)
    (cond ((null lst) Nil)
          ((is-between-1-10 (car lst)) 
                    (cons (car lst) (select-between-1-10 (cdr lst))))
          (t (select-between-1-10 (cdr lst)))))

;; 4. Функция, которая умножает на заданное число-аргумент все числа из заданного списка-аргумента, когда:
;;      а) все элементы списка --- числа;
(defun multiply-list-1(lst x)
    (cond ((null lst) Nil)
          (t (cons (* (car lst) x)
                   (multiply-list-1 (cdr lst) x)))))

;;      б) элементы списка --- любые объекты.
(defun multiply-list-2(lst x)
    (cond ((null lst) Nil)
          ((numberp (car lst)) 
                (cons (* (car lst) x) 
                      (multiply-list-2 (cdr lst) x)))
          ((listp (car lst)) 
                (cons (multiply-list-2 (car lst) x)
                      (multiply-list-2 (cdr lst) x)))
          (t (cons (car lst)
                   (multiply-list-2 (cdr lst) x)))))

;; 5. Функция select-between, которая из списка-аргумента, содержащего только числа, выбирает только те, которые расположены между двумя указанными границами-аргументами и возвращает их в виде списка (доп.: упорядоченного по возрастанию)
(defun my-sort(lst)
    (let ((tmp 0))
         (cond ((null lst) Nil)
               (t (cons (and (setf tmp (apply #'min lst))
                             (setf (car (member tmp lst)) (car lst))
                             (setf (car lst) tmp))
                        (my-sort (cdr lst)))))))

(defun select-between(lst a b)
    (cond ((null lst) Nil)
          ((or (and (< a (car lst))
                    (> b (car lst)))
               (and (< b (car lst))
                    (> a (car lst))))
                            (my-sort (cons (car lst) (select-between (cdr lst) a b))))
          (t (select-between (cdr lst) a b))))

;; 6. Функция rec-add, вычисляющая сумму чисел заданного списка:
;;      а) одноуровнего смешанного;
(defun rec-add-1(lst)
    (cond ((null lst) 0)
          ((numberp (car lst)) 
                (+ (car lst) (rec-add-1 (cdr lst))))
          (t (rec-add-1 (cdr lst)))))

;;      б) структурированного.
(defun rec-add-2(lst)
    (cond ((null lst) 0)
          ((numberp (car lst))
                (+ (car lst) (rec-add-2 (cdr lst))))
          ((listp (car lst))
                (+ (rec-add-2 (car lst)) 
                   (rec-add-2 (cdr lst))))
          (t (rec-add-2 (cdr lst)))))

;; 7. Функция recnth --- рекурсивная версия nth
(defun recnth(n lst)
    (cond ((= n 0) (car lst))
          (t (recnth (- n 1) (cdr lst)))))

;; 8. Функция allodd, которая возвращает t, когда все элементы списка нечетные
(defun allodd(lst)
    (cond ((null lst) T)
          ((evenp (car lst)) Nil)
          (t (allodd (cdr lst)))))

;; 9. Функция, которая возвращает первое нечетное число из структурированного списка
(defun first-odd(lst)
    (cond ((null lst) Nil)
          ((and (numberp lst) (oddp lst)) 
                    lst)
          ((atom lst) Nil)
          (t (or (first-odd (car lst)) 
                 (first-odd (cdr lst))))))

;; 10. Используя cons-дополняемую рекурсию с одним тестом завершения, написать функцию, которая получает как аргумент список чисел, а возвращает список квадратов этих чисел в том же порядке
(defun squared-list(lst)
    (cond ((null lst) Nil)
          (t (cons (* (car lst) (car lst)) 
                   (squared-list (cdr lst))))))
