(uiop:define-package #:40ants-slynk
  (:use #:cl)
  (:nicknames #:40ants-slynk/core)
  (:export #:hello
           #:make-hello
           #:say))
(in-package #:40ants-slynk)


(defclass hello ()
  ((name :initform :name
         :reader user-name))
  (:documentation "Example class."))


(defun make-hello (name)
  "Makes hello world example"
  (make-instance 'hello
                 :name name))


(defgeneric say (obj)
  (:documentation "Say what should be said.")
  (:method ((obj hello))
    (format nil "Hello, ~A!~%"
            (user-name obj))))
