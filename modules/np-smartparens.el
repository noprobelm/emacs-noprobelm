;;; np-smartparens.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package smartparens
  :hook ((prog-mode . smartparens-mode)
         (text-mode . smartparens-mode))
  :config
  (require 'smartparens-config)
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil))

(provide 'np-smartparens)
;;; np-smartparens.el ends here.
