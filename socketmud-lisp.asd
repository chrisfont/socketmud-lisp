;;;; socketmud-lisp.asd

(asdf:defsystem #:socketmud-lisp
  :description "Describe socketmud-lisp here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :serial t
  :components ((:file "package")
               (:file "socketmud-lisp")
               (:file "event"))
  :depends-on (:usocket))
