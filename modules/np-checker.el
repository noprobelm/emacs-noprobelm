;;; np-checker.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package flycheck
  :config
  :init (global-flycheck-mode)
  )
(use-package ispell
  :elpaca nil
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US")
  (setq ispell-personal-dictionary "~/.hunspell_personal")
  )

(use-package flycheck-aspell
  :after (flycheck ispell)
  :config
  ;; If you want to check TeX/LaTeX/ConTeXt buffers
  (add-to-list 'flycheck-checkers 'tex-aspell-dynamic)
  ;; If you want to check Markdown/GFM buffers
  (add-to-list 'flycheck-checkers 'markdown-aspell-dynamic)
  ;; If you want to check HTML buffers
  (add-to-list 'flycheck-checkers 'html-aspell-dynamic)
  ;; If you want to check XML/SGML buffers
  (add-to-list 'flycheck-checkers 'xml-aspell-dynamic)
  ;; If you want to check Nroff/Troff/Groff buffers
  (add-to-list 'flycheck-checkers 'nroff-aspell-dynamic)
  ;; If you want to check Texinfo buffers
  (add-to-list 'flycheck-checkers 'texinfo-aspell-dynamic)
  ;; If you want to check comments and strings for C-like languages
  (add-to-list 'flycheck-checkers 'c-aspell-dynamic)
  ;; If you want to check message buffers
  (add-to-list 'flycheck-checkers 'mail-aspell-dynamic)
  ;; Because Aspell does not support Org syntax, the user has
  ;; to define a checker with the desired flags themselves.
  (flycheck-aspell-define-checker "org"
				  "Org" ("--add-filter" "url")
				  (org-mode))
  (add-to-list 'flycheck-checkers 'org-aspell-dynamic)
  )

(provide 'np-checker)
;;; np-checker.el ends here.
