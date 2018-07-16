
(define (open el)
 (string-append "<"
  (symbol->string (car el))))

(define (close el)
 (string-append "</"
  (symbol->string (car el)) ">"))

(define (to-pair ls)
 (let ((a (car ls))
       (b (cadr ls))
       (rest (cddr ls)))
  (if (> (length rest) 0)
   (cons (cons a b) (to-pair rest))
   `(,(cons a b)))))

(define (as-string a)
 (if (symbol? a)
  (symbol->string a)
  a))

(define (attrs->string prs)
 (let ((fs (car prs))
       (rest (cdr prs)))
  (let ((attr-val (string-append
                  (as-string (car fs))
                   "=\""
                   (as-string (cdr fs))
                   "\"")))
   (if (> (length rest) 0)
    (string-append attr-val " " (attrs->string rest))
    attr-val))))

(define (attrs el)
 (string-append (attrs->string (to-pair (cadr el)))
  ">"))

(define (children el)
 (let ((ls (caddr el)))
  (if (list? ls)
   #t
   ls)))

(define (serialize el)
 (string-append
  (open el) " " (attrs el) (children el) (close el)))
