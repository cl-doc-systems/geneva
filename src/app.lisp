(defpackage #:example/app
  (:use #:cl)
  (:import-from #:example/utils)
  (:documentation "This is docstring for the package.

                   The package contains a function which does it's job by
                   applying transformation to the first and second arguments.

                   By the way, Geneva's mk2 parser is able to process
                   idented docstrings.")
  (:export #:foo))
(in-package example/app)


(defun foo (first &key (other 100500))
  "This is example function.

   Internally it calls [example/utils:do-the-job](utils.html#section-1-1)
   to do the real job.

   Note, that the link above is broken, but Coo does not warn us when building the docs.
   Sphinx issues a warning inn such case."
  (example/utils:do-the-job first other))
