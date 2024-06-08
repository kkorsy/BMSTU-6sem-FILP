(defun f1(x) 
            (car 
                (car 
                    (cdr x))))

(defun f2(x) 
            (car 
                (cdr 
                    (car 
                        (car 
                            (cdr 
                                (car 
                                    (cdr x))))))))

(defun f(x y) 
    (+ 
        (* 3 
            (* x 
                (* x x)) ) 
                            y) )
(defun ff(x y) 
    (cons 'f 
          (cons x 
                (cons y Nil) ) ) )

(setf a '(1 (2 ((3 4)))))