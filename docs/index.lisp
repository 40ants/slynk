(uiop:define-package #:40ants-slynk-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:40ants-slynk-docs/changelog
                #:@changelog)
  (:import-from #:40ants-slynk)
  (:import-from #:docs-config
                #:docs-config)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:40ants-slynk-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "40ants-slynk-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS")))
  )


(defsection @index (:title "40ants-slynk - Utilities to start SLYNK if needed and to track active connections."
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "TODO"
                                   "Unlicense"
                                   "REPL"
                                   "GIT"
                                   "ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "SLY"
                                   "SLYNK"
                                   "SLYNK_PORT"
                                   "PORT"
                                   "SLYNK_INTERFACE"
                                   "40A")
                    :external-docs ("https://40ants.com/logging/"))
  (40ants-slynk system)
  "
[![](https://github-actions.40ants.com/40ants/slynk/matrix.svg?only=ci.run-tests)](https://github.com/40ants/slynk/actions)

![Quicklisp](http://quickdocs.org/badge/40ants-slynk.svg)
"
  (@installation section)
  (@usage section)
  (@api section))


(defsection-copy @readme @index)


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :40ants-slynk)
```
""")


(defsection @usage (:title "Usage")
  "
This library provides a little helper, used in 40Ants webservices.
it does two things:

- Starts Slynk server in there is SLYNK_PORT env variable.
- Setup logging for connected Slynk connection. It uses 40ANTS-LOGGING system for configuration.
")

(defsection @api (:title "API")
  (40ants-slynk:*connections* variable)
  (40ants-slynk:start-slynk-if-needed function))
