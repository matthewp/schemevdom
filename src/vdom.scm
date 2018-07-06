(library (vdom)
 (export diff run-demo)
 (import rnrs)

 (define (diff old new)
  (let ((changes '(4 87)))
   new))
 
 (define (run-demo)
  (let ((old '(div () "Hello world"))
        (new '(div () "Hello Wilbur")))

   (let ((patches (diff old new)))
    (begin
     (display patches)
     (newline)
     patches)))))
