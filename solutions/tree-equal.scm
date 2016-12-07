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
             (and (eqv? (tree-tag tree1) (tree-tag tree2))
                  (set-equal? (tree-labels tree1) (tree-labels tree2))
                  (or (leaf? tree1)
                      (and (node? tree1)
                           (tree-equal? (node-left tree1) (node-left tree2))
                           (tree-equal? (node-right tree1) (node-right tree2)))))))))

;;; Solution Comments:
;;; The basis case of this function is that the two trees are null and if so return true
;;; otherwise by the inductive case return true if all the following are true:
;;;   - The current node tags are equal
;;;   - The current node labels are equivalent sets
;;;   - Either of the following:
;;;       * The current node is a leaf
;;;       * The following are all true:
;;;           ~ The current node is a node
;;;           ~ The current nodes left trees are equal
;;;           ~ The current nodes right trees are equal
;;;
