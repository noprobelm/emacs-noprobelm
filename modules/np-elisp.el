;;; np-elisp.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package elisp-mode
  :after evil
  :ensure nil
  :init
  (defun np/elisp-mode-setup ()
    (setq indent-tabs-mode nil)
    (electric-pair-mode 1)
    (hs-minor-mode 1))

  (add-hook 'emacs-lisp-mode-hook #'np/elisp-mode-setup))

(use-package rainbow-delimiters
  :after elisp-mode
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

(use-package lispy
  :after elisp-mode
  :hook
  (emacs-lisp-mode . lispy-mode)
  (lisp-data-mode . lispy-mode)
  :init
  (setq lispy-eval-display-style 'message))

(use-package lispyville
  :hook (emacs-lisp-mode . lispyville-mode))

(use-package package-lint
  :after elisp-mode)

(use-package flycheck-package
  :after elisp-mode)

(use-package erefactor
  :ensure (:type git :host github :repo "mhayashi1120/Emacs-erefactor")
  :hook (emacs-lisp-mode . erefactor-lazy-highlight-turn-on))

(use-package page-break-lines
  :init
  (dolist (hook '(emacs-lisp-mode-hook
                  help-mode-hook))
    (add-hook hook #'page-break-lines-mode)))

(use-package eros
  :hook (emacs-lisp-mode . eros-mode))

(use-package outline
  :after evil
  :ensure nil
  :hook (emacs-lisp-mode . outline-minor-mode))

(provide 'np-elisp)
;;; np-elisp.el ends here.
