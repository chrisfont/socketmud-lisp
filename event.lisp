;;;; event.lisp

(in-package :socketmud-lisp)

(defstruct event
  (fun      (lambda () nil) :type function)
  (argument  ""             :type string)
  (passes    0              :type integer)
  (type      0              :type integer)
  (ownertype 'unknown       :type symbol)
  (bucket    'none          :type symbol)
  (owner     nil))
