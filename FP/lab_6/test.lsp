(load "../lab_6/def.lsp")
(load "~/quicklisp/setup.lisp")
(ql:quickload "fiveam")
(use-package :fiveam)

(test my-sort-test
    (is (equal '(1 2 3) (my-sort '(3 2 1))))
    (is (equal '(1) (my-sort '(1))))
    (is (equal '(1 1 2 2 2 3) (my-sort '(1 2 3 2 1 2))))
    (is (equal '(1 1 2 2 3 3) (my-sort '(1 2 3 (1 2 3)))))
    (is (equal '(1 2 3 4 5) (my-sort '((1) 2 (3 4) ((5)))))))

(run! 'my-sort-test)