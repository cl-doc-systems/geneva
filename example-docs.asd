;; The code below does not work as expected, because
;; when you'll run (asdf:make "example/docs") the documentation
;; on packages will be missing. And asdf:make produces this strange errors:
;; Unknown error: #<ASDF/PACKAGE-INFERRED-SYSTEM:PACKAGE-INFERRED-SYSTEM "example"> is not a string designator.
;; Unknown error: :FORCE and :FORCE-NOT arguments not allowed in a nested call to ASDF/OPERATE:OPERATE unless identically to toplevel

(defclass build-docs-op (asdf:non-propagating-operation) ()
  (:documentation "Builds a documentations for the system."))


(defmethod asdf:perform ((o build-docs-op) (c asdf:system))
  (uiop:symbol-call :coo :document-system
                    (asdf:primary-system-name c)
                    :base-path (asdf/system:component-build-pathname c)))


(defsystem example-docs
  :class :package-inferred-system
  :pathname "docs/scripts/"
  :depends-on ("example"
               "example-docs/build")
  :build-operation build-docs-op
  :build-pathname "docs/build/")


(register-system-packages "geneva-html" '(#:geneva.html))
(register-system-packages "geneva-mk2" '(#:geneva.mk2))
(register-system-packages "geneva-cl" '(#:geneva.cl))
