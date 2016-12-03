;;; Coursework 02
;;; Question 02
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define tree-map
  (lambda (f tree)
    (cond ((null? tree)
          '())
          ((node? tree)
           (list the-node-tag (f (tree-labels tree)) (tree-map f (node-left tree)) (tree-map f (node-left tree))))
          ((leaf? tree)
           (list the-leaf-tag (f (tree-labels tree)))))))

;;; Solution Comments:
;;;
