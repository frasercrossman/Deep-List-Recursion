;;; Coursework 02
;;; Question 04
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(load "tree-implementation-list.scm")

(define make-vertex
  (lambda (id labels)
    (list 'vertex id labels)))

(define make-edge
  (lambda (src des)
        (list 'edge src des)))

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
           (cons (make-vertex 't (tree-labels tree))
                 (tree-to-graph-set tree '(t)))))))

(define tree-to-graph-set
  (lambda (tree id)
    (cond ((leaf? tree)
           '())
          ((node? tree)
           (let ((left-id (cons 'l id))
                 (right-id (cons 'r id)))
             (cond ((or (node? (node-left tree))
                        (node? (node-right tree)))
                    (append (list (make-vertex (create-label left-id) (tree-labels (node-left tree)))
                                  (make-vertex (create-label right-id) (tree-labels (node-right tree)))
                                  (make-edge (create-label id) (create-label left-id))
                                  (make-edge (create-label id) (create-label right-id)))
                            (tree-to-graph-set (node-left tree) left-id)
                            (tree-to-graph-set (node-right tree) right-id)))
                   (else
                    (list (make-vertex (create-label left-id) (tree-labels (node-left tree)))
                          (make-vertex (create-label right-id) (tree-labels (node-right tree)))
                          (make-edge (create-label id) (create-label left-id))
                          (make-edge (create-label id) (create-label right-id))))))))))
           
;;; Solution Comments:
;;;
