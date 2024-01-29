;;; np-smartparens.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package smartparens
  :straight t
  :config
  (require 'smartparens-config)
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'text-mode-hook #'smartparens-mode))

(provide 'np-smartparens)
;;; np-smartparens.el ends here.
