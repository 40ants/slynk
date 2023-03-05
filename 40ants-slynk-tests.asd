(defsystem "40ants-slynk-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides tests for 40ants-slynk."
  :source-control (:git "https://github.com/40ants/slynk")
  :bug-tracker "https://github.com/40ants/slynk/issues"
  :pathname "t"
  :depends-on ("40ants-slynk-tests/core")
  :perform (test-op :after (op c)
                    (symbol-call :rove :run c))  )
