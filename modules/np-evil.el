;;; np-evil.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package evil
  :straight t
  :after general
  :init
  (setq evil-want-integration t)
  ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-fu)
  ;; Window keybinds
  )

(use-package evil-collection
  :straight t
  :init (evil-collection-init)
  :custom (evil-collection-setup-minibuffer t) ;; Enables evil in the minifbuffer
)

(provide 'np-evil)
;;; np-evil.el ends here.
