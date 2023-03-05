(defsystem "40ants-slynk-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides CI settings for 40ants-slynk."
  :source-control (:git "https://github.com/40ants/slynk")
  :bug-tracker "https://github.com/40ants/slynk/issues"
  :pathname "src"
  :depends-on ("40ants-slynk-ci/ci"))
