(defsystem "40ants-slynk-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides documentation for 40ants-slynk."
  :source-control (:git "https://github.com/40ants/slynk")
  :bug-tracker "https://github.com/40ants/slynk/issues"
  :pathname "docs"
  :depends-on ("40ants-slynk"
               "40ants-slynk-docs/index"))
