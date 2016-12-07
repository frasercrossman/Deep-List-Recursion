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
    (if (null? tree)
           (cont '() '())
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
;;; Continuation Passing Style requires that all function calls occur in
;;; terminal position and this can be seen to be used in all three possible
;;; cases: null, leaf, and node
;;;
;;; If the tree is null then the continuation is called with two empty lists.
;;; If the tree is not null then the predicate is checked against the
;;; labels of the tree.
;;;   If the tree is a leaf then the continuation is called with arguments
;;;   dependent upon the result of the predicate check.
;;;   If the tree is a node then tree-filter-cps is called for the left node of the
;;;   tree where the continuation is determined by calling tree-filter-cps for the
;;;   right node of the tree and finally the continuation is called with
;;;   arguments dependent upon the result of the predicate check. 
;;;
;;; This style of function execution means that the stack is not used and instead
;;; the continuation function contains the information about how the final result
;;; is constructed.
;;;
