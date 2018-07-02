(library (vdom)
 (export diff run-demo)
 (import rnrs)

 (define (diff old new)
  (let ((changes '( 1 2)))
   changes))
 
 (define (run-demo)
  (diff 1 2)))
