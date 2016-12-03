;;; This binary tree implementation has been provided by
;;; lecturer Luc Moreau as part of the coursework specification.
;;; It is used to test my proposed solutions to the questions.
;;;

(define the-node-tag    (list 'node))
(define the-leaf-tag    (list 'leaf))

(define node?
  (lambda (tree)
    (and (pair? tree) (eq? (tree-tag tree) the-node-tag))))

(define leaf?
  (lambda (tree)
    (and (pair? tree) (eq? (tree-tag tree) the-leaf-tag))))

(define tree-tag    car)
(define tree-labels cadr)
(define node-left   caddr)
(define node-right  cadddr)

(define make-node
  (lambda (labels left right)
    (list the-node-tag labels left right)))

(define make-leaf
  (lambda (labels)
    (list the-leaf-tag labels)))

(define set-union
  (lambda (set1 set2)
    (cond ((null? set1) set2)
	  ((memq (car set1) set2) (set-union (cdr set1) set2))
	  (else (cons (car set1) (set-union (cdr set1) set2))))))

(define set-minus
  (lambda (set1 set2)
    (cond ((null? set1) '())
          ((member (car set1) set2) (set-minus (cdr set1) set2))
          (else (cons (car set1) (set-minus (cdr set1) set2))))))

(define set-equal?
  (lambda (set1 set2)
    (and (null? (set-minus set1 set2))
         (null? (set-minus set2 set1)))))

