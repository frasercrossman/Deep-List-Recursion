;;; Coursework 02
;;; Question 03
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define tree-merge
  (lambda (tree1 tree2)
    (cond ((and (null? tree1)
                (null? tree2))
           '())
          ((leaf? tree1)
           (list the-node-tag
                 (set-union (tree-labels tree1) (tree-labels tree2))
                 (node-left tree2)
                 (node-right tree2)))
          ((leaf? tree2)
           (list the-node-tag
                 (set-union (tree-labels tree1) (tree-labels tree2))
                 (node-left tree1)
                 (node-right tree1)))
          (else
           (list the-node-tag
                 (set-union (tree-labels tree1) (tree-labels tree2))
                 (tree-merge (node-left tree1) (node-left tree2))
                 (tree-merge (node-right tree1) (node-right tree2)))))))

;;; Solution Comments:
;;;
