;;; np-flycheck.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package flycheck-eglot
  :after flycheck
  :hook (flycheck-mode . flycheck-eglot-mode))

(use-package flymake
  :elpaca nil
  :after evil
  :config
  (setq elisp-flymake-byte-compile-load-path load-path))

(use-package ispell
  :elpaca nil
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US")
  (setq ispell-personal-dictionary "~/.hunspell_personal"))

(use-package flycheck-aspell
  :after (flycheck ispell)
  :config
  (add-to-list 'flycheck-checkers 'tex-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'markdown-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'html-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'xml-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'nroff-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'texinfo-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'c-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'mail-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'org-aspell-dynamic)
  (flycheck-aspell-define-checker "org"
				  "Org" ("--add-filter" "url")
				  (org-mode)))


(provide 'np-flycheck)
;;; np-flycheck.el ends here.
