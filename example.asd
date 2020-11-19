(defsystem "example" 
  :class :package-inferred-system
  :author "Alexander Artemenko"
  :license "Unlicense"
  :pathname "src"
  :description "This description will be used only if long-description is missing"
  :long-description #.(uiop:read-file-string #P"docs/source/index.mk2")
  :depends-on ("example/app"))
