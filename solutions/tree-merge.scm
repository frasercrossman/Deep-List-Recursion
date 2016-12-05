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
;;;
