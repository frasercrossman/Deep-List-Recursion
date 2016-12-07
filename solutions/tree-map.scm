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
           (make-node (f (tree-labels tree)) (tree-map f (node-left tree)) (tree-map f (node-right tree))))
          ((leaf? tree)
           (make-leaf (f (tree-labels tree)))))))

(define remove-labels
  (lambda (labels tree)
    (tree-map (lambda (set) (set-minus set labels)) tree)))

;;; Solution Comments:
;;; The basis case of this function is that the current node in the tree is
;;; null and if so return the empty list.
;;; Otherwise if the current node in the tree is a node:
;;;   return a node with labels transformed by the mapping with left and right
;;;   trees with transformed mappings.
;;; Otherwise if the current node in the tree is a leaf:
;;;   return a leaf with labels transformed by the mapping
;;;
