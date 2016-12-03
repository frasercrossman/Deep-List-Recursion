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
           (list the-node-tag (f (tree-labels tree)) (tree-map f (node-left tree)) (tree-map f (node-right tree))))
          ((leaf? tree)
           (list the-leaf-tag (f (tree-labels tree)))))))

(define remove-labels
  (lambda (labels tree)
    (tree-map (lambda (set) (set-minus set labels)) tree)))

;;; Solution Comments:
;;;
