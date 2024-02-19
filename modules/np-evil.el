;;; np-evil.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package evil
  :after general
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-fu))

(use-package evil-collection
  :init (evil-collection-init)
  :custom (evil-collection-setup-minibuffer t))

(provide 'np-evil)
;;; np-evil.el ends here.
