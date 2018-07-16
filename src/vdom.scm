(library (vdom)
 (export diff run-demo)
 (import rnrs)

 (define (diff old new)
  (let ((bv (make-bytevector 10))
        (changes '(4 87)))
   (begin
    (display bv)
    (newline)
    new)))
 
 (define (run-demo)
  (let ((old '(div () "Hello world"))
        (new '(div () "Hello Wilbur")))

   (let ((patches (diff old new)))
    (begin
     (display patches)
     (newline)
     patches)))))
