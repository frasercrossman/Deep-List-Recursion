;;; Coursework 01
;;; Question 01
;;; Fraser Crossman (fc4g15@soton.ac.uk)
;;;

;;; Solution:

(define assoc-all
  (lambda (sym alist)
    (if (null? alist)
        '()
        (if (equal? sym (caar alist))
            (cons (cdar alist) (assoc-all sym (cdr alist)))
            (assoc-all sym (cdr alist))))))

;;; Solution Comments:
;;; To construct the list of values associated with the specified 
;;; symbolic expression in the specified association list the following 
;;; method was used.
;;; 
;;; Basis case:
;;; The list is null as either the list passed was empty or the end has 
;;; been reached. The empty list is returned.
;;;
;;; Inductive case:
;;; Recursively traverse the association list, inspecting the value of 
;;; the key of the first association in the list on each call.
;;;
;;; If the predicate "(equal? <symbolic-exp> <key>)" is satisfied then 
;;; construct a pair with the car pointing to the associated value of 
;;; the matching key, and the cdr pointing to the recursively determined 
;;; list of other values associated with the matching keys.
;;; Otherwise the association is skipped and the function is recursively 
;;; called using the same symbolic expression and the rest of the 
;;; association list.
;;;
;;; The use of "equal?" as opposed to "eq?" or "eqv?" is important.
;;; "eq?"    - Returns true if two values share the same enivronment 
;;;            pointer otherwise returns false.
;;; "eqv?"   - Returns true if two atomic values are equal or as "eq?" 
;;;            returns true otherwise returns false.
;;; "equal?" - Returns true if two lists, vectors, etc. have corresponding 
;;;            elements or as "eqv?" returns true otherwise returns false.
;;;						
;;; The equivalent 'corresponding elements' feature is important as the 
;;; key may not be an atomic value and so when checked for equivalence 
;;; with a symbolic expression all corresponding elements must be checked 
;;; for equivalence to be determined.
;;;
