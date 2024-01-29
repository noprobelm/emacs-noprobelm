;;; np-completion.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package helm
  :straight t
  :config
  (helm-mode 1))

(use-package company
  :straight t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'np-completion)
;;; np-completion.el ends here.
