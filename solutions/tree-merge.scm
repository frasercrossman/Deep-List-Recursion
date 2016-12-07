;;; Coursework 02
;;; Question 03
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define tree-merge
  (lambda (tree1 tree2)
    (cond ((null? tree1)
           tree2)
          ((null? tree2)
           tree1)
          (else (let ((label (set-union (tree-labels tree1) (tree-labels tree2))))
                  (cond ((and (leaf? tree1)
                              (leaf? tree2))
                              (make-leaf label))
                        ((leaf? tree1)
                         (make-node label (node-left tree2) (node-right tree2)))
                        ((leaf? tree2)
                         (make-node label (node-left tree1) (node-right tree1)))
                        (else
                         (make-node label
                                    (tree-merge (node-left tree1) (node-left tree2))
                                    (tree-merge (node-right tree1) (node-right tree2))))))))))

;;; Solution Comments:
;;; The basis case of this function is that the current node in tree1 or tree2 is
;;; null and if so then return the other tree respectively
;;; Otherwise the union of the sets of labels of the current nodes of the two trees
;;; is created.
;;; Then it is checked if both trees are leaves and if so then a leaf with the
;;; union of the labels is created.
;;; If only one of the trees is a leaf then a node is created with the union of the
;;; labels and children set to the reset of the other tree respectively.
;;; If both of the trees are nodes then a node is created with the union of the
;;; labels and children set the the left and right merged trees.
;;;