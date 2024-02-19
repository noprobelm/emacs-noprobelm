;;; np-scratch.el --- Basics -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(setq initial-major-mode 'org-mode)

(setq initial-scratch-message "\
* Emacs Lisp
#+BEGIN_SRC emacs-lisp :session scratch

#+END_SRC

* Python
#+BEGIN_SRC python :session scratch

#+END_SRC

* Rust
#+BEGIN_SRC rust :session scratch

#+END_SRC

* Shell
#+BEGIN_SRC shell :session scratch

#+END_SRC
")

(provide 'np-scratch)
;;; np-scratch.el ends here.
