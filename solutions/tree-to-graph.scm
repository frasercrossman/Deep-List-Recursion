;;; Coursework 02
;;; Question 04
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define create-label
  (lambda (l)
         (string->symbol (symbol-append-reverse l))))

(define symbol-append-reverse
  (lambda (los)
    (if (null? los)
        ""
        (string-append (symbol-append-reverse (cdr los))
                       (symbol->string (car los))))))

(define tree-to-graph
  (lambda (tree)
    (cond ((null? tree)
           '())
          (else
           (tree-to-graph-set tree (list 't))))))

(define tree-to-graph-set
  (lambda (tree id)
    (cond ((leaf? tree)
           (list 'vertex (create-label id) (tree-labels tree)))
          ((node? tree)
           (list (list 'vertex (create-label id) (tree-labels tree))
                 (list 'edge (create-label id) (create-label (cons 'l id)))
                 (list 'edge (create-label id) (create-label (cons 'r id)))
                 (tree-to-graph-set (node-left tree) (cons 'l id))
                 (tree-to-graph-set (node-right tree) (cons 'r id)))))))

;;; Solution Comments:
;;;
