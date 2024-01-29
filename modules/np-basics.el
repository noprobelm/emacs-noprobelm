;;; np-basics.el --- Basics -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(defvar my-laptop-p (equal (system-name) "framework"))

(setq inhibit-startup-message t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/auto-save-list/" t)))

(setq scroll-conservatively 101)
(global-hl-line-mode 1)
(add-hook 'prog-mode-hook
	  (lambda () (setq display-line-numbers 'relative)))
(add-hook 'text-mode-hook
	  (lambda () (setq display-line-numbers 'relative)))
(add-hook 'org-mode-hook
	  (lambda () (setq display-line-numbers 'absolute)))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-16"))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)
(local-set-key [f1] 'help-for-help)
(setq kill-ring-max 1000)

(defun my-reload-emacs-configuration ()
  "Reload my config."
  (interactive)
  (load-file "~/.emacs.noprobelm/init.el"))

(provide 'np-basics)
;;; np-basics.el ends here.