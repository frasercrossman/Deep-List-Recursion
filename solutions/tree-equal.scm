;;; Coursework 02
;;; Question 01
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define tree-equal?
  (lambda (tree1 tree2)
    (or (and (null? tree1)
             (null? tree2))
        (and (not (null? tree1))
             (not (null? tree2))
             (and (eqv? (car tree1) (car tree2))
                  (set-equal? (tree-labels tree1) (tree-labels tree2))
                  (or (leaf? tree1)
                      (and (node? tree1)
                           (tree-equal? (node-left tree1) (node-left tree2))
                           (tree-equal? (node-right tree1) (node-right tree2)))))))))

;;; Solution Comments:
;;;
