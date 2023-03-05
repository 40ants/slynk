(defsystem "40ants-slynk"
  :description "Utilities to start SLYNK if needed and to track active connections."
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/slynk"
  :source-control (:git "https://github.com/40ants/slynk")
  :bug-tracker "https://github.com/40ants/slynk/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :serial t
  :depends-on ("slynk/mrepl"
               "40ants-slynk/core")
  :in-order-to ((test-op (test-op "40ants-slynk-tests"))))
