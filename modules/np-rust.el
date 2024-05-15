;;; np-python.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package rustic
  :after corfu
  :mode ("\\.rs\\'" . rustic-mode)
  :init
  (setopt rustic-lsp-client 'eglot)
  (defun np/rustic-docstring-front-page ()
    "Use `comment-dwim' to make a docstring."
  (interactive)
  (let ((comment-start "//! "))
    (call-interactively 'comment-dwim))))

(provide 'np-rust)
;;; np-rust.el ends here.
