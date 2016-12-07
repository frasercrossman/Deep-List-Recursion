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
    (cond ((null? tree)
           (cont '() '()))
          (else
           (pred (tree-labels tree)
                 (lambda (b)
                   (cond ((leaf? tree)
                          (let ((yes-leaf (make-leaf (tree-labels tree)))
                                (no-leaf (make-leaf '())))
                          (if b (cont yes-leaf no-leaf)
                                (cont no-leaf yes-leaf))))
                         ((node? tree)
                          (let ((yes-node (make-node (tree-labels tree)
                                                     (tree-filter-cps pred
                                                                      (node-left tree)
                                                                      (lambda (yes no)
                                                                        (cont yes no)))
                                                     (tree-filter-cps pred
                                                                       (node-right tree)
                                                                       (lambda (yes no)
                                                                         (cont yes no)))))
                                (no-node (make-node '()
                                                     (tree-filter-cps pred
                                                                      (node-left tree)
                                                                      (lambda (yes no)
                                                                        (cont yes no)))
                                                     (tree-filter-cps pred
                                                                       (node-right tree)
                                                                       (lambda (yes no)
                                                                         (cont yes no))))))
                            (if b
                                (cont yes-node no-node)
                                (cont no-node yes-node)))))))))))

;(let ((tree (make-node '(aaa)
;                       (make-leaf '(b))
;                       (make-leaf '(a)))))
;  (instrument-count-pairs
;   (lambda ()
;     (tree-filter-cps member-a tree cons))))

(tree-filter-cps member-a (make-node '(aaa)
                       (make-leaf '(b))
                       (make-leaf '(a))) (lambda (yes no) yes))

;;; Solution Comments:
;;;
