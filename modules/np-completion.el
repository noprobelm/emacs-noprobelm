;;; np-completion.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package helm
  :config
  (helm-mode 1))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'np-completion)
;;; np-completion.el ends here.
