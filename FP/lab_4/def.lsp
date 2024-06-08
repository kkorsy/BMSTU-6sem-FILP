(setf b '(+ - * /))
(setf a 'b)

(defun b(n)
    (nth n b))

(defun a(n lst)
    (apply (b n) lst))