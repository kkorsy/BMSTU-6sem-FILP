(setf b '(1 -1 0 s -2 3 e))
(setf a 'b)

(defun a(lst)
    (mapcar #'(lambda(x)
                (cond ((numberp x)
                            (cond ((< x 0)
                                        (cond ((oddp x)
                                                    (* x x))
                                              (t (+ x 20))))
                                   ((> x  0)
                                        (- x 10))
                                   (t x)))
                       (t x)))
                lst))
                

(fiveam:test a_test_1
    (fiveam:is (equal '(-9 -8 -7) (a '(1 2 3)))))

(fiveam:test a_test_2
    (fiveam:is (equal '(0 a b -6) (a '(0 a b 4)))))

(fiveam:test a_test_3
    (fiveam:is (equal '(1 18 9) (a '(-1 -2 -3)))))

(fiveam:test a_test_4
    (fiveam:is (equal '(a) (a '(a)))))

(fiveam:test a_test_5
    (fiveam:is (equal '() (a '()))))