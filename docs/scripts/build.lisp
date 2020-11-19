(defpackage #:example-docs/build
  (:use #:cl)
  (:import-from #:geneva.html)
  (:import-from #:geneva.mk2)
  (:import-from #:geneva.cl)
  (:export
   #:build))
(in-package example-docs/build)


(defun build ()
  (flet ((document-package (package)
           (check-type package keyword)
           (let ((filename (format nil "docs/build/~A.html"
                                   (string-downcase package))))
             (ensure-directories-exist filename)
             (uiop:with-output-file (s filename
                                       :if-exists :supersede)
               (geneva.html:render-html (geneva.cl:api-document package)
                                        :stream s)))))
    (document-package :example/app)
    (document-package :example/utils))

  
  (let ((document (with-open-file (s "docs/source/index.mk2")
                    (geneva.mk2:read-mk2 s))))
    (uiop:with-output-file (s "docs/build/index.html" :if-exists :supersede)
      (geneva.html:render-html document :stream s))))
