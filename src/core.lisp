(uiop:define-package #:40ants-slynk
  (:use #:cl)
  (:nicknames #:40ants-slynk/core)

  (:import-from #:log4cl)
  (:import-from #:global-vars
                #:define-global-var)

  (:import-from #:slynk)
  (:import-from #:slynk-macrostep)
  (:import-from #:slynk-named-readtables)
  ;; I need to make it work with original non patched Slynk first:
  ;; (:import-from #:slynk-package-inferred)
  (:import-from #:40ants-logging
                #:setup-for-repl
                #:remove-repl-appender)
  
  (:export #:*connections*
           #:start-slynk-if-needed))
(in-package #:40ants-slynk)


(define-global-var *connections* nil
  "Here we'll store all Slynk connections.")

(define-global-var *slynk-already-running* nil)

(define-global-var *default-slynk-interface*
  "127.0.0.1"
  "An interface to run SLYNK on if SLYNK_PORT env variable was given.")

;; We need to define this variable before slynk will load
;; mrepl plugin, because otherwise when we do slynk:create-server,
;; it will load mrepl system which will define this variable as T.
;; But we need to set it to NIL to be able to connect to the
;; Slynk running inside the Docker container or on other server
;; behind the firewall.
(defvar slynk:*use-dedicated-output-stream*)


;; This is a hack used to get attach a logger to the output stream.
;; We need it because when SLYNK calls a slynk-api:*new-connection-hook*
;; there is no listener yet.
(defmethod initialize-instance :after ((repl slynk-mrepl::mrepl) &key)
  (let* ((stream (slot-value repl 'slynk::out)))
    (setup-for-repl :stream stream)))


(defun on-connection-open (conn)
  (log:info "SLY connected ~S"
            *standard-output*)
  (push conn *connections*))


(defun on-connection-close (conn)
  (remove-repl-appender)
  
  (log:info "SLY disconnected")
  (setf *connections*
        (remove conn *connections*)))


(defun start-slynk-if-needed ()
  "Use this function before starting the backend server.

   If SLYNK_PORT environment variable is set, then this function
   will create a Slynk server on that port and localhost interface.
   To change an interface, set SLYNK_INTERFACE environment variable."
  
  (when (and (uiop:getenv "SLYNK_PORT")
             (not *slynk-already-running*))
    (let ((port (parse-integer (uiop:getenv "SLYNK_PORT")))
	  (interface (or (uiop:getenv "SLYNK_INTERFACE")
			 *default-slynk-interface*))
	  (hostname (machine-instance)))
      (slynk-api:add-hook slynk-api:*new-connection-hook*
			  'on-connection-open)
      (slynk-api:add-hook slynk-api:*connection-closed-hook*
			  'on-connection-close)
      (setf slynk:*use-dedicated-output-stream* nil)

      ;; To suppress this message from SLYNK:
      ;; Slynk started at port: 4005.
      ;; we need to override these two streams:
      (let* ((dev-null (make-broadcast-stream))
             (*standard-output* dev-null)
             (*error-output* dev-null)
             (slynk:*log-output* dev-null))
        (slynk:create-server :dont-close t
                             :port port
                             :interface interface))
      (log:info "If this process is running on remote host, make a tunnel by running: \"ssh -6 -L ~A:localhost:4005 ~A\". Then open local Emacs and connect to the slynk on 4005 port."
                port
                hostname)
      (setf *slynk-already-running* t)))
  (values))



