;;; np-org.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package ob-rust
  :straight t)

(use-package org
  :straight nil
  :init
  (setq
   org-agenda-files '("~/workshop/org/")
   org-startup-indented t
   org-return-follows-link t
   org-display-inline-images t
   org-hide-emphasis-markers t
   org-startup-with-inline-images t
   org-src-fontify-natively t
   org-src-window-setup 'current-window
   org-src-preserve-indentation t
   org-src-tab-acts-natively t
   org-tabs-mode nil
   org-confirm-babel-evaluate nil)

  (setq org-todo-keywords
        '((sequence "TODO" "APPT" "IDEA" "WAIT" "|" "DONE" "KILL")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (rust . t)
     (R . t)
     (C . t)
     (shell . t)
     (css . t)
     (java . t)
     (latex . t)
     (calc . t)
     (lua . t)
     (perl . t)
     (sed . t)
     (sql . t)
     (sqlite . t)
     ))

  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(org-level-1 ((t (:height 180 :extend t :inherit outline-1))))
   '(org-level-2 ((t (:height 170 :extend t :inherit outline-2))))
   '(org-level-3 ((t (:height 160 :extend t :inherit outline-3))))
   '(org-level-4 ((t (:height 150 :extend t :inherit outline-4))))
   '(org-level-5 ((t (:height 150 :extend t :inherit outline-5))))
   '(org-level-6 ((t (:height 140 :extend t :inherit outline-6))))
   '(org-level-7 ((t (:height 130 :extend t :inherit outline-7))))
   ))

(use-package org-wc
  :straight t)

(use-package org-superstar
  :straight t
  :config
  (setq org-superstar-headline-bullets-list
	'(;; Original ones nicked from org-bullets
    ?
    ?
    ?◉
    ?)
	org-superstar-special-todo-items t)
  (add-hook 'org-mode-hook
	    (lambda () (org-superstar-mode 1))))

(provide 'np-org)
;;; np-org.el ends here.
