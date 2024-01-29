;;; np-python.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package rustic
  :straight t
  :after eglot
  :mode ("\\.rs\\'" . rustic-mode)
  :init
  (setq rustic-lsp-client 'eglot))

(provide 'np-rust)
;;; np-rust.el ends here.
