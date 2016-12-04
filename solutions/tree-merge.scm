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
          (else (let ((label (set-union (tree-labels tree1) (tree-labels tree2)))
                      (tag ((lambda (tree1 tree2)
                             (if (and (leaf? tree1)
                                      (leaf? tree2))
                                 the-leaf-tag
                                 the-node-tag)) tree1 tree2))
                      (left (lambda (tree)
                                  (cond ((leaf? tree)
                                         '())
                                        ((node? tree)
                                         (node-left tree)))))
                      (right (lambda (tree)
                                  (cond ((leaf? tree)
                                         '())
                                        ((node? tree)
                                         (node-right tree))))))
                  (list tag label
                        (tree-merge (left tree1) (left tree2))
                        (tree-merge (right tree1) (right tree2))))))))

;;; Solution Comments:
;;;
