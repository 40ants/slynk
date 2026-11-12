(uiop:define-package #:40ants-slynk-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-slynk-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP"
                              "FASL"
                              "DIR"))
  (0.2.0 2026-11-12
         "* Added support for FASL_DIR environment variable. When it is set, Slynk writes fasl-files into that directory (mirroring the structure of sources) instead of placing them near the sources. This makes it possible to connect Sly to a server, running under another user or with a read-only filesystem.")
  (0.1.0 2023-02-05
         "* Initial version."))
