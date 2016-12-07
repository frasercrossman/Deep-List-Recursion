;;; Coursework 02
;;; Question 05
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define member-a
  (lambda (l cont)
    (cond ((null? l) (cont #f))
          ((member (car l) '(a aa aaa aaaa aaaaa)) (cont #t))
          (else (member-a (cdr l) cont)))))

(define tree-filter-cps
  (lambda (pred tree cont)
    (if ((null? tree)
           (cont '() '()))
        (pred (tree-labels tree)
              (lambda (b)
                (cond ((leaf? tree)
                       (if b
                           (cont (make-leaf (tree-labels tree)) (make-leaf '()))
                           (cont (make-leaf '()) (make-leaf (tree-labels tree)))))
                      ((node? tree)
                       (tree-filter-cps
                        pred
                        (node-left tree)
                        (lambda (yes-left no-left)
                          (tree-filter-cps
                           pred
                           (node-right tree)
                           (lambda (yes-right no-right)
                             (if b
                                 (cont (make-node (tree-labels tree) yes-left yes-right)
                                       (make-node '() no-left no-right))
                                 (cont (make-node '() yes-left yes-right)
                                       (make-node (tree-labels tree) no-left no-right))))))))))))))

;;; Solution Comments:
;;; 
;;;
