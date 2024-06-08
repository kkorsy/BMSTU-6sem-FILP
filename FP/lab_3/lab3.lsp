; 1. Функция, принимающая целое число и возвращающая первое четное число, не меньшее аргумента
(defun f1(x) 
        (if (evenp x) x
                (+ x 1)))

; 2. Функция, принимающая число и возвращающая число того же знака, но с модулем на 1 больше модуля аргумента
(defun f2(x)
        (if (< x 0) (- (+ 1 (abs x)))
                    (+ 1 (abs x))))

; 3. Функция, принимающая 2 числа и возвращающая список из этих двух чисел, расположенный по возрастанию
(defun f3(x y)
        (if (< x y) (cons x 
                           (cons y Nil))
                    (cons y
                           (cons x Nil))))

; 4. Функция, принимающая 3 числа и возвращающая Т только тогда, когда первое число расположено между вторым и третьим
(defun f4(x y z)
        (or (and (> x y)
                 (< x z))
            (and (< x y)
                 (> x z))))

; 5. Каков результат вычисления следующих выражений
(and 'fee 'fie 'foe)            ; --> foe
(or nil 'fie 'foe)              ; --> fie
(and (equal 'abc 'abc) 'yes)    ; --> yes
(or 'fee 'fie 'foe)             ; --> fee
(and nil 'fie 'foe)             ; --> nil
(or (equal 'abc 'abc) 'yes)     ; --> t

; 6. Предикат, который принимает 2 числа-аргумента и возвращает Т, если первое число не меньше второго
(defun f6(x y)
        (>= x y))

; 7. Какой из следующих двух вариантов предиката ошибочен и почему?
(defun pred1(x)
        (and (numberp x)(plusp x)))

(defun pred2(x)
        (and (plusp x)(numberp x))) ; ошибочен: сначала необходимо проверить, что х -- число

; 8. Решить задачу 4, используя для ее решения конструкции: только if, только cond, только and/or
(defun f8-1(x y z)
        (if (> x y) 
                (< x z) 
                (if (< x y)
                        (> x z)
                        Nil)))

(defun f8-2(x y z)
        (cond ((> x y) (< x z))
              ((< x y) (> x z))))

(defun f8-3(x y z)
        (or 
            (and (> x y) (< x z)))
            (and (< x y) (> x z)))

; 9. Переписать функцию how-alike, использующую cond, используя только конструкции if, and/or
(defun how-alike(x y)
        (cond ((or (= x y) (equal x y)) 'the_same)
              ((and (oddp x) (oddp y)) 'both_odd)
              ((and (evenp x) (evenp y)) 'both_even)
              (t 'difference)))

(defun f9-1(x y)
        (if (= x y)
                'the_same
                (if (equal x y)
                        'the_same
                        (if (oddp x)
                                (if (oddp y)
                                        'both_odd
                                        'difference)
                                (if (evenp x)
                                        (if (evenp y)
                                                'both_even
                                                'difference)
                                        'difference)))))
                                        
(defun f9-2(x y)
        (or (and (or (= x y) 
                        (equal x y))
                 'the_same)
            (and (and (oddp x)
                        (oddp y))
                 'both_odd)
            (and (and (evenp x)
                        (evenp y))
                 'both_even)
             'difference))